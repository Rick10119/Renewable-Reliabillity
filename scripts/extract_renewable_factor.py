import xarray as xr
import pandas as pd

# 安徽省地级市经纬度数据
anhui_cities = [
    {'name': 'Hefei', 'lat': 31.86, 'lon': 117.27},      # 合肥
    {'name': 'Wuhu', 'lat': 31.33, 'lon': 118.37},       # 芜湖
    {'name': 'Bengbu', 'lat': 32.92, 'lon': 117.38},     # 蚌埠
    {'name': 'Huainan', 'lat': 32.63, 'lon': 116.98},    # 淮南
    {'name': 'Maanshan', 'lat': 31.67, 'lon': 118.50},   # 马鞍山
    {'name': 'Huaibei', 'lat': 33.95, 'lon': 116.78},    # 淮北
    {'name': 'Tongling', 'lat': 30.95, 'lon': 117.82},   # 铜陵
    {'name': 'Anqing', 'lat': 30.50, 'lon': 117.05},     # 安庆
    {'name': 'Huangshan', 'lat': 29.72, 'lon': 118.33},  # 黄山
    {'name': 'Chuzhou', 'lat': 32.32, 'lon': 118.32},    # 滁州
    {'name': 'Fuyang', 'lat': 32.90, 'lon': 115.82},     # 阜阳
    {'name': 'Suzhou', 'lat': 33.63, 'lon': 116.98},     # 宿州
    {'name': 'Lu_an', 'lat': 31.73, 'lon': 116.52},      # 六安
    {'name': 'Bozhou', 'lat': 33.85, 'lon': 115.77},     # 亳州
    {'name': 'Chizhou', 'lat': 30.65, 'lon': 117.48},    # 池州
    {'name': 'Xuancheng', 'lat': 30.95, 'lon': 118.75}   # 宣城
]

# 读取风电和光伏数据
wind_data = xr.open_dataset('./data/resources/wind_factor-china-2020.nc')
pv_data = xr.open_dataset('./data/resources/pv_factor-china-2020.nc')

# 创建存储数据的字典
wind_data_dict = {}
pv_data_dict = {}

# 遍历所有城市
for city in anhui_cities:
    # 提取风电数据
    wind_series = wind_data.sel(y=city['lat'], x=city['lon'], method='nearest')['capacity factor']
    wind_series = wind_series.to_pandas()
    # 调整时间到北京时间（UTC+8）
    wind_series.index = wind_series.index + pd.Timedelta(hours=8)
    # 只保留2020年的数据
    wind_series = wind_series['2020']
    wind_data_dict[city['name']] = wind_series
    
    # 提取光伏数据
    pv_series = pv_data.sel(y=city['lat'], x=city['lon'], method='nearest')['capacity factor']
    pv_series = pv_series.to_pandas()
    # 调整时间到北京时间（UTC+8）
    pv_series.index = pv_series.index + pd.Timedelta(hours=8)
    # 只保留2020年的数据
    pv_series = pv_series['2020']
    pv_data_dict[city['name']] = pv_series

# 转换为DataFrame
wind_df = pd.DataFrame(wind_data_dict)
pv_df = pd.DataFrame(pv_data_dict)

# 保存数据
wind_df.to_csv('./data/resources/anhui_wind_factors_2020.csv')
pv_df.to_csv('./data/resources/anhui_pv_factors_2020.csv')

# 打印数据信息
print("风电数据形状:", wind_df.shape)
print("光伏数据形状:", pv_df.shape)
print("\n风电数据预览:")
print(wind_df.head())
print("\n光伏数据预览:")
print(pv_df.head())


