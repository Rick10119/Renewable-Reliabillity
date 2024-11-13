import atlite
from atlite import Cutout
import xarray as xr
import pandas as pd

# 创建一个 Cutout 对象，指定时间和空间范围(2020年)
cutout = Cutout(
    path="./cutouts/China-2020.nc",
    module="era5",
    time="2020"

)

# 准备数据
cutout.prepare()

# 获取风电出力时间序列(2020年全年)
# 选择一个风机配置
turbine = "Vestas_V112_3MW"
wind_output = cutout.wind(turbine=turbine,
                            capacity_factor_timeseries=True)
# 将wind_output导出为 nc
wind_output.to_netcdf('./data/resources/wind_factor-china-2020.nc')

# 获取光伏出力时间序列
orientation = {"slope": 45.0, "azimuth": 180.0}  # 平板方向设置
pv_output = cutout.pv(
    atlite.resource.solarpanels.CSi,  # 使用晶硅光伏板
    orientation,
    capacity_factor_timeseries=True
)

# 将pv_output导出为 nc
pv_output.to_netcdf('./data/resources/pv_factor-china-2020.nc')
