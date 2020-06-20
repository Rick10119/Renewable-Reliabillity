clc;
clear;
format long
result=[];
result_1=[];
for iii=4:6
    Kind = iii; %���ֶ�Ӧ��������
for iiii=1:9    %iiii=6;
    Ratio_w = 1+0.3375*2*iiii; %������
    Ratio_p = 1+0.27*2*iiii; %�������
    P_u_min = 10*(1-iiii/10);
    P_u_max = 45*(1-iiii/10);
for ii=1:20
    micro_grid
    EDNS_matrix(:,ii)=EDNS;
    lose_pv(ii)=sum(P_p_max'-value(P_p))/sum(P_p_max);
    if sum(P_w_max)<0.001
        lose_wind(ii)=0;
    else
    lose_wind(ii)=sum(P_w_max'-value(P_w))/sum(P_w_max);
    end
    penetrite(ii)=sum(value(P_w+P_w))/sum(value(P_w+P_w+P_u));
end
lolp_hours=sum(sum(EDNS_matrix>0.001,2)/20)/96;
lolpe_hours=sum(sum(EDNS_matrix,2)/20)/96;
lose_pv_kind=mean(lose_pv);
lose_wind_kind=mean(lose_wind);
penetrite_kind=mean(penetrite);
result=[result;[lolp_hours,lolpe_hours,lose_pv_kind,lose_wind_kind,penetrite_kind]];
end
result_1=[result_1;result];
end
%    0.110416666666667   0.696783600762269   0.001672861130619   0.016853083236161   0.188692817347109
%    0.120208333333333   0.783541367916549   0.000694014102069   0.022296911936517   0.189354887220089
%    0.133229166666667   0.783428685346799   0.001497955771052   0.021272102929536   0.180559625764303
%    0.191145833333333   1.500170103167058  -0.000000000000000  -0.000000000000000   0.016381928155420
%    0.218750000000000   1.621163813480782  -0.000000000000000   0.000000000000000   0.018967468874388
%    0.243750000000000   1.733429286888966   0.000125051219175   0.000000000000000   0.015948956308598



%                    0  -0.000000000000003   0.000176143044534  -0.000000000000000   0.257798889189475
%    0.032291666666667   0.232173548740782   0.003442282500228   0.006066770978091   0.370753159714393
%    0.159375000000000   1.017883003241574   0.013456028697830   0.016836346995585   0.404203989499111
%    0.231770833333333   2.157778220131203   0.023818123055998   0.046877960879613   0.486461008526280
%    0.335416666666667   3.731098711583881   0.056523136190422   0.067087820429683   0.550640113330573
%    0.374479166666667   5.398007313254421   0.081021040217200   0.098387625965679   0.626907217267996
%    0.444791666666667   7.609126647238494   0.079917070861148   0.109823965360440   0.671357970167155
%    0.413541666666667   7.590620040335779   0.103074166545549   0.127016603229163   0.805689384806444
%    0.484895833333334  10.865399960341293   0.101428901356233   0.158224369313490   0.875294058618158
%                    0  -0.000000000000003   0.000059876294115   0.000313254531402   0.262163055988761
%    0.033854166666667   0.278858493723287   0.001999837117910   0.003670324093714   0.307948317858953
%    0.127083333333333   0.782261816735076   0.023417124475332   0.017069351265132   0.451639357508829
%    0.237500000000000   1.904976369947390   0.014888738782959   0.028118596390527   0.455283583448986
%    0.334895833333333   4.230355302277343   0.053541400392023   0.079934989460636   0.535690631226447
%    0.419270833333333   6.031534839917323   0.037412182510146   0.058496403039865   0.579714096525926
%    0.403125000000000   7.033622409714293   0.088617345037235   0.113285381852032   0.702568125631744
%    0.435937500000000   8.581787335076019   0.089994217673615   0.141215452776452   0.796498627640003
%    0.462500000000000  10.398348884130273   0.164013460508745   0.208345495764872   0.901331637696655
%                    0  -0.000000000000003   0.000090481262556  -0.000000000000000   0.298663562697757
%    0.031250000000000   0.214768798076124   0.003267489958033   0.002266427526711   0.360860912898824
%    0.169791666666667   1.104613061584314   0.013734819309798   0.018079524363395   0.368292245568558
%    0.235937500000000   2.054876411298320   0.027357017957701   0.046961604493950   0.446159065616670
%    0.343229166666667   4.079939826621932   0.047307884501002   0.051456805852920   0.497849152197427
%    0.387500000000000   5.632704465349296   0.081446106853765   0.087460845889714   0.601405649240843
%    0.442708333333333   7.369211651715844   0.089334262934990   0.103111792918834   0.696470220724392
%    0.413541666666667   8.039166576607565   0.106356755172032   0.149844930580798   0.796259954170536
%    0.481770833333333  10.565316268021393   0.128238406145751   0.193286687797056   0.877530091336848
%                    0  -0.000000000000003   0.000186701404430   0.000410738535619   0.276261115205634
%    0.027083333333333   0.168154754028238   0.006713912339156   0.005343519481030   0.339040966886526
%    0.144270833333333   0.924659637844397   0.012541606091519   0.016344742428885   0.395400452969005
%    0.247916666666667   2.339957087907188   0.020208718651539   0.024533536356141   0.465850137494548
%    0.273437500000000   3.046461681708978   0.055118247734982   0.044055926677578   0.571441814338532
%    0.353125000000000   4.936748350902723   0.074531074864177   0.103070571400648   0.634909662686981
%    0.424479166666667   6.558459729875639   0.081665696365622   0.142407324262621   0.706776650934565
%    0.442708333333333   8.846630474054479   0.095988529353535   0.153617813573881   0.774161388046366
%    0.471354166666667   9.813175459472788   0.157550582554970   0.170842079236340   0.905504409562024
%                    0  -0.000000000000003   0.000014577456159   0.000229829037741   0.250710303518030
%    0.025520833333333   0.189088708794474   0.001371079830062   0.003666700046265   0.329050414413637
%    0.143229166666667   1.038490214089362   0.005580066290396   0.010684960173630   0.376985416036534
%    0.232291666666667   2.111264510247684   0.023167793127311   0.049881377111188   0.469482413120727
%    0.336458333333333   3.877835654272324   0.051862566076972   0.069943163515309   0.528250437251782
%    0.319270833333333   4.436877549159354   0.048080909618189   0.067976602343706   0.642544166998476
%    0.372916666666667   5.734379796940743   0.125705352225684   0.116466224150691   0.743418138807968
%    0.470312500000000   9.358585203538896   0.117279927252302   0.169466384581805   0.780984563108849
%    0.462500000000000  10.101756096471689   0.140763729070907   0.188182756731758   0.876736997024360
%                    0  -0.000000000000003   0.000563564743831   0.000474287129217   0.257944053741742
%    0.030208333333333   0.264713522858102   0.005642303283708   0.005491211496309   0.347384882294729
%    0.138020833333333   0.980587942833340   0.007234495279365   0.013061408245484   0.425922836301904
%    0.255729166666667   2.587727304896637   0.021102622957556   0.030730130227360   0.442840481437165
%    0.320312500000000   3.822342786677835   0.038404313957354   0.049757768814193   0.543036681835060
%    0.382812500000000   5.057974497342590   0.075407510855511   0.075467512421946   0.613212766554923
%    0.399479166666667   6.807664902132060   0.110506508293870   0.116191605950540   0.722888716048089
%    0.454687500000000   8.647018006184776   0.094470181049216   0.146156368678329   0.781343406413090
%    0.468750000000000  10.426997419716688   0.134550829465715   0.166813802557088   0.884127096706909


%                    0  -0.000000000000003   0.000050953780053   0.000565004898192   0.309622956248259
%    0.043750000000000   0.307879009765077   0.005432173538512   0.010430742454654   0.299281771209922
%    0.148437500000000   0.961076607248531   0.027984428878921   0.037744691950805   0.454705655026230
%    0.236458333333333   2.100629593730599   0.056880401042440   0.077844463124408   0.502510356778229
%    0.284375000000000   3.202050044911487   0.137516073402307   0.187495541431618   0.617310193561856
%    0.352083333333333   4.806711120816096   0.109020560534558   0.150970757457795   0.626761667187023
%    0.360416666666667   6.099861793673839   0.211920795676700   0.226780170487871   0.763320998752418
%    0.337500000000000   6.384603452569071   0.208226159882177   0.272854999624890   0.841399252150836
%    0.411979166666667   8.640697163762182   0.274896167583678   0.271966264725288   0.903450288422608
%                    0  -0.000000000000003   0.000064845835728   0.000219923612553   0.311098690584423
%    0.022395833333333   0.162387557560005   0.014783181170514   0.016819590225585   0.360402556473716
%    0.116145833333333   0.742898687049524   0.032771640453147   0.034422647282705   0.471568427523381
%    0.230729166666667   1.962357419592191   0.069458722689790   0.092272310888129   0.547787049213743
%    0.260937500000000   2.627194984138598   0.088847764369946   0.135267790019761   0.643551996396265
%    0.368229166666667   5.016325659073237   0.141678489162046   0.177728711575262   0.630970425491756
%    0.323958333333333   5.288705806333562   0.146068197290466   0.201098138920963   0.749383226243012
%    0.339583333333333   5.694408859445342   0.231443289664092   0.260621084941854   0.847684836144545
%    0.327083333333333   6.810948792890969   0.250483995222416   0.291974272176867   0.929025443518323
%                    0  -0.000000000000003   0.000272267188361   0.000113949535039   0.348613474942916
%    0.019270833333333   0.141912453172145   0.008178598457021   0.020613380335258   0.404208794730966
%    0.141145833333333   0.879737762190631   0.019970073029605   0.044711758885670   0.428712822408104
%    0.234375000000000   2.013028826695788   0.042196920027105   0.066243603435721   0.509875845560815
%    0.201562500000000   2.100508126345841   0.118030054098122   0.129951126003133   0.672576314491065
%    0.304166666666667   4.126252594174345   0.127378409400342   0.149424783104131   0.669921986295108
%    0.366666666666667   5.917239765234318   0.191921987597775   0.171264362107735   0.736033099345949
%    0.423958333333333   7.736820829490147   0.209402334862043   0.204240921991356   0.811005244616276
%    0.390625000000000   8.138134670693431   0.258806777902932   0.274122378706592   0.911243723506398
%                    0  -0.000000000000003   0.000558473629673   0.001481481676977   0.331824711674731
%    0.026041666666667   0.164770730422352   0.007638603970517   0.011484599036258   0.397679618675655
%    0.141145833333333   0.806037047761262   0.032569135340373   0.059517604997761   0.492453880704314
%    0.271354166666667   2.473436742223987   0.086148005688556   0.111185823380860   0.496698673750891
%    0.285416666666667   3.031402903104605   0.089083860770372   0.137438045950941   0.587097360952761
%    0.270312500000000   3.489142239403500   0.164012453965463   0.196922236048045   0.727394998147056
%    0.369791666666667   5.765039188954532   0.175094281463219   0.205616904704404   0.742396379294130
%    0.370833333333333   6.767474402838851   0.240118103735929   0.223358081303560   0.834997952406091
%    0.411979166666667   8.378706000460213   0.228448933779697   0.277512185388451   0.909859800541689
%                    0  -0.000000000000003   0.000184211122250   0.000839604214204   0.290967941208919
%    0.038541666666667   0.301671468784758   0.002835217445927   0.008471729368025   0.327961732257320
%    0.112500000000000   0.761048980182341   0.019175629351921   0.031142730675783   0.487719860456351
%    0.218750000000000   1.760091809296475   0.062668445352605   0.060527433218281   0.511857617530300
%    0.263541666666667   2.838213344920189   0.120319977353050   0.148179812598084   0.637493055122377
%    0.317187500000000   4.252514577264766   0.144796539363148   0.202612392641608   0.683690533066629
%    0.358854166666667   5.921723751609925   0.195956966557682   0.204023212418718   0.756338791485325
%    0.389062500000000   7.558741320340393   0.200988069388182   0.270267372291349   0.807239212728456
%    0.403125000000000   9.183510182156985   0.287123053414295   0.308701053306800   0.894625200231867
%                    0  -0.000000000000003   0.000718078561361   0.001078245513010   0.347220572453313
%    0.014583333333333   0.086113078537952   0.012851212568994   0.015980141316427   0.445371490919931
%    0.097916666666667   0.521425616590214   0.022297973791622   0.046391688182064   0.438906611406892
%    0.235937500000000   1.939953438915405   0.043878635437114   0.083847855775065   0.528144132367012
%    0.265625000000000   2.718459674849344   0.071578499607155   0.103949456043639   0.628727885811579
%    0.317187500000000   4.293260220416522   0.121936670949890   0.156366898776220   0.679156110689442
%    0.346875000000000   5.433464756015810   0.207031433729968   0.233007936832836   0.771774317809792
%    0.422395833333333   7.903598739641371   0.244082250201979   0.261838856445088   0.809251478581462
%    0.372395833333333   7.292901099056272   0.309687429574338   0.301639664277052   0.918359287639925



%                    0  -0.000000000000003   0.000663330914188   0.002219888512655   0.336185521964743
%    0.012500000000000   0.083889751416128   0.025671558715501   0.061602407236549   0.467232223229256
%    0.055208333333333   0.308300299660102   0.071308032503477   0.100763355123087   0.547618817657603
%    0.181250000000000   1.385210022870346   0.195740677739606   0.185854781323400   0.615054086265610
%    0.189583333333333   1.875387094439753   0.239943745929042   0.265295107907252   0.693166983168477
%    0.258854166666667   3.304728854234452   0.357549207958455   0.343660692307905   0.731939579402265
%    0.278125000000000   4.313391335525560   0.366166629045095   0.383322877346063   0.792862081037110
%    0.346875000000000   6.815008819042046   0.446935285221809   0.405264533268555   0.857529702961076
%    0.318750000000000   6.561195605729472   0.425387873241559   0.443003621285682   0.926216654220058
%                    0  -0.000000000000003   0.001214410893374   0.002345936518582   0.301690745609863
%    0.029166666666667   0.174420036627123   0.029067144303403   0.043175620310996   0.467778000816867
%    0.107812500000000   0.564983253320864   0.104784812485007   0.144874708506596   0.529544495509749
%    0.184895833333333   1.582782274129287   0.217460364590939   0.247577243157571   0.605396441098751
%    0.217708333333333   2.243051800788015   0.245157889679171   0.273687068039145   0.666921018564596
%    0.243229166666667   2.914875121329053   0.297254043189767   0.293826576687305   0.736713980651018
%    0.315104166666667   5.133376498136435   0.337499108935656   0.330683901213879   0.759344300583257
%    0.313020833333333   5.831577066363707   0.389842108631641   0.388017033252166   0.848708200513551
%    0.301041666666667   6.146542949940039   0.471946213698199   0.411900811053011   0.936313471109995
%                    0  -0.000000000000003   0.002142447400663   0.001506132002563   0.323566544572961
%    0.025520833333333   0.123663202351337   0.053351421055314   0.057269324823722   0.478430437513073
%    0.116666666666667   0.509027051650187   0.138438335044598   0.132196875367946   0.555778293280844
%    0.200520833333333   1.792852157191459   0.197799492646238   0.213585056876899   0.593397227557685
%    0.197916666666667   2.070360444976149   0.255756676384272   0.308208002329454   0.697301890933927
%    0.247916666666667   3.284727025573602   0.308336053830249   0.316564165193472   0.710530454068571
%    0.273958333333333   4.099415261472133   0.341091697075821   0.363444598881434   0.796014263835963
%    0.358854166666667   6.707845328715865   0.414943216369049   0.384097007912774   0.838016005947988
%    0.332291666666667   7.043507608458572   0.464065310582017   0.409860384964529   0.926359004995789
%                    0  -0.000000000000003   0.002981580537713   0.003544199668234   0.356146462375417
%    0.027083333333333   0.221373097723703   0.032034078052078   0.033160202306795   0.448232430981537
%    0.090625000000000   0.371349839157587   0.084080328300472   0.142001255152040   0.586486448117793
%    0.183854166666667   1.520704356289362   0.142948855946304   0.177653403344863   0.578691907155139
%    0.236979166666667   2.592253089093613   0.284202755651391   0.273117791391712   0.643747103943044
%    0.251562500000000   3.260814918609337   0.286896076213903   0.284554295844670   0.724508086728715
%    0.307291666666667   5.079155121969532   0.337023543552636   0.352505135192855   0.752749710120433
%    0.321354166666667   5.640587795195782   0.423753329546815   0.412945149755196   0.864626664315529
%    0.316145833333333   6.758864173837118   0.478431005290687   0.366911420755819   0.934683250902355
%                    0  -0.000000000000003   0.001698681566247   0.003692103387108   0.339242769591536
%    0.014583333333333   0.129764493541385   0.032999166698257   0.051221843480175   0.474710656502356
%    0.098437500000000   0.562590525625235   0.107805592748090   0.143510271967419   0.550824637205150
%    0.194270833333333   1.515544503082319   0.139680884876190   0.213616942618364   0.569785305015301
%    0.217708333333333   2.161885539079382   0.246611971937503   0.289071463452783   0.666272176686121
%    0.211458333333333   2.644849661793807   0.310484324236942   0.312479078074381   0.745527231696241
%    0.303125000000000   4.797567566130963   0.372671277773611   0.366027938722588   0.783555665151323
%    0.330729166666667   6.082473422310874   0.369810646178092   0.330768432705276   0.830620460746099
%    0.360937500000000   7.630591943963769   0.436579920434787   0.420535463530433   0.923820139052674
%                    0  -0.000000000000003   0.003459039306724   0.002745497401949   0.412542811596545
%    0.011979166666667   0.076951991937741   0.046124926117247   0.051119384067705   0.519100612650622
%    0.117187500000000   0.584688034784040   0.100653598799103   0.113021348953029   0.517276901914119
%    0.173958333333333   1.470571381651897   0.189942614644084   0.212022726335482   0.602947659493633
%    0.191666666666667   2.067573927134274   0.242100823362184   0.266366871327706   0.660898369730546
%    0.240625000000000   3.131759647064463   0.289237723811421   0.314488260496193   0.715832572336270
%    0.310937500000000   4.943200502742363   0.407055066122867   0.371229002348931   0.795264835510040
%    0.283333333333333   5.202546417326228   0.413129196344182   0.403899052232791   0.869742337867645
%    0.287500000000000   6.198261359526708   0.473597077841857   0.430266260690544   0.932030810798507



%                    0  -0.000000000000003   0.000663330914188   0.002219888512655   0.336185521964743
%    0.012500000000000   0.083889751416128   0.025671558715501   0.061602407236549   0.467232223229256
%    0.055208333333333   0.308300299660102   0.071308032503477   0.100763355123087   0.547618817657603
%    0.181250000000000   1.385210022870346   0.195740677739606   0.185854781323400   0.615054086265610
%    0.189583333333333   1.875387094439753   0.239943745929042   0.265295107907252   0.693166983168477
%    0.258854166666667   3.304728854234452   0.357549207958455   0.343660692307905   0.731939579402265
%    0.278125000000000   4.313391335525560   0.366166629045095   0.383322877346063   0.792862081037110
%    0.346875000000000   6.815008819042046   0.446935285221809   0.405264533268555   0.857529702961076
%    0.318750000000000   6.561195605729472   0.425387873241559   0.443003621285682   0.926216654220058
%    0.001041666666667   0.007587755515969   0.007729019096546   0.001471044096427   0.317155826384741
%    0.053645833333333   0.330108485592489   0.029070722233251   0.038794765486983   0.370455272289374
%    0.148437500000000   0.932345644371669   0.057947166407414   0.053650626640140   0.471647160770119
%    0.241145833333333   2.432430357428848   0.114717602754322   0.135501187274579   0.566093219413383
%    0.221354166666667   2.248768610526312   0.117866561279463   0.140738711039687   0.658368041297506
%    0.298437500000000   3.686277064652133   0.166315267806921   0.184763187115695   0.735369039498889
%    0.381770833333333   5.979386962234419   0.196453056995431   0.210812964416406   0.782547464794050
%    0.465625000000000   8.553226068949181   0.181308169491166   0.188024496920190   0.825763105717499
%    0.419791666666667   8.498925849333061   0.245649017394843   0.263659862587173   0.933182404956396
%    0.013541666666667   0.094304987777905   0.004074808068742   0.005807624326371   0.286389543627866
%    0.058333333333333   0.432861926549242   0.036732242930750   0.034983702077659   0.393134488755390
%    0.222395833333333   1.623285895063617   0.075455155646283   0.084499098364657   0.433950212420894
%    0.323437500000000   3.514792355242354   0.106650925127993   0.080806768031152   0.512991468719372
%    0.310416666666667   3.763652452801727   0.145592179588855   0.148042836533142   0.653130157126146
%    0.378645833333333   5.312416178541679   0.188777942317083   0.206845526759947   0.718275906831101
%    0.514583333333333   9.006411287579853   0.150110852153068   0.181159702488732   0.733709626376431
%    0.495312500000000  10.134712080980774   0.196783144436755   0.229746457390807   0.841949062494312
%    0.563020833333333  13.385414366007295   0.204128120335781   0.260301161046036   0.898487262498673
%                    0  -0.000000000000003  -0.000000000000000   0.000000000000000   0.032483059285111
%    0.100000000000000   0.927578314536811   0.000345777965052   0.005931051008971   0.047798330953219
%    0.378125000000000   2.830796391106745   0.006018516303142   0.007623287481898   0.066884623227637
%    0.450000000000000   5.008354921039156   0.038298206431999   0.120340182656490   0.095387131601007
%    0.500520833333333   7.200582544039150   0.107352305369953   0.126596925858574   0.135823665544625
%    0.529166666666667   9.157339906992194   0.158949971248839   0.243499328069682   0.188835498479683
%    0.550520833333333  11.685941257437690   0.233887569003634   0.322280717320058   0.220337396939660
%    0.550000000000000  14.262771631234955   0.271907870701674   0.383705155541514   0.275116123998107
%    0.561458333333334  15.991270708844228   0.309570574639363   0.331017291148294   0.428647231833075
%    0.225000000000000   1.900511127317920   0.002889401288285   0.003943978097088   0.031799258385614
%    0.580729166666667   4.641257727786859   0.010714230000716   0.018795180739685   0.037813074730060
%    0.708854166666667   7.762101424890992   0.020654716843486   0.010132861309562   0.051503842178341
%    0.728645833333334  10.066692783483361   0.038549118015236   0.029512297183061   0.093360632838749
%    0.782812500000000  13.218358722225830   0.060169302568117   0.011730956030012   0.111143689776259
%    0.803125000000000  16.245357810351990   0.049074258441556   0.022831732034462   0.168636216324826
%    0.810416666666667  19.271113514932427   0.074096314880933   0.037945142927681   0.198246083256108
%    0.829166666666667  22.725550965117147   0.064730304071099   0.037692623173136   0.220095859551397
%    0.810937500000000  25.232271309346345   0.081172201778078   0.091174622335775   0.443679933697779
%    0.347395833333333   2.912417783657790   0.002664905092319   0.000948015863312   0.022874851178978
%    0.661458333333333   5.589960850249205   0.012837943948868   0.014597451519766   0.050019458306856
%    0.794791666666666   9.116722161119563   0.030032718547875   0.006482370828540   0.050457658057531
%    0.831770833333334  12.378994646699660   0.038532891668941   0.008535102220855   0.068468967988548
%    0.866666666666666  15.627721394115087   0.036399042625134   0.042081620271759   0.120064625141742
%    0.843750000000000  18.083283451493944   0.064647721095931   0.037156805885534   0.184434683338854
%    0.873437500000000  22.249101361340731   0.060202886668536   0.031727781906483   0.173680963879225
%    0.889062500000000  25.526442070247167   0.076496267878208   0.050467356794192   0.309007733159473
%    0.868229166666667  28.304959026481800   0.070684596079532   0.056404237906731   0.441123995791508