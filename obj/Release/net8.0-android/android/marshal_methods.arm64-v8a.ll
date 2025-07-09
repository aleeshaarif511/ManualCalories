; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [165 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [330 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 51
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 164
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 55
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 119
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 70
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 87
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 7: System.Reflection.Primitives => 0x7c6829760de3975 => 135
	i64 750875890346172408, ; 8: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 153
	i64 799765834175365804, ; 9: System.ComponentModel.dll => 0xb1956c9f18442ac => 104
	i64 827489077433209015, ; 10: IMS_CGM_Mobile_App => 0xb7bd4ee83ec10b7 => 94
	i64 849051935479314978, ; 11: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 12: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 64
	i64 872800313462103108, ; 13: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 75
	i64 1010599046655515943, ; 14: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 135
	i64 1055774368762298424, ; 15: ar/Microsoft.Maui.Controls.resources => 0xea6dd31d50a0038 => 0
	i64 1120440138749646132, ; 16: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 91
	i64 1121665720830085036, ; 17: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 18: System.Drawing.dll => 0x119be62002c19ebb => 113
	i64 1301485588176585670, ; 19: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 63
	i64 1369545283391376210, ; 20: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 83
	i64 1476839205573959279, ; 21: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 125
	i64 1486715745332614827, ; 22: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 52
	i64 1513467482682125403, ; 23: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 163
	i64 1518315023656898250, ; 24: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 65
	i64 1537168428375924959, ; 25: System.Threading.Thread.dll => 0x15551e8a954ae0df => 153
	i64 1556147632182429976, ; 26: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 27: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 68
	i64 1628611045998245443, ; 28: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 80
	i64 1643226597988041431, ; 29: pl/Microsoft.Maui.Controls.resources => 0x16cde9e27a8d02d7 => 20
	i64 1672383392659050004, ; 30: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 36
	i64 1731380447121279447, ; 31: Newtonsoft.Json => 0x18071957e9b889d7 => 57
	i64 1743969030606105336, ; 32: System.Memory.dll => 0x1833d297e88f2af8 => 122
	i64 1767386781656293639, ; 33: System.Private.Uri.dll => 0x188704e9f5582107 => 129
	i64 1795316252682057001, ; 34: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 67
	i64 1825687700144851180, ; 35: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 139
	i64 1836611346387731153, ; 36: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 87
	i64 1875417405349196092, ; 37: System.Drawing.Primitives => 0x1a06d2319b6c713c => 112
	i64 1920760634179481754, ; 38: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 53
	i64 1959996714666907089, ; 39: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 40: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 79
	i64 1983698669889758782, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 42: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 43: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 112
	i64 2133195048986300728, ; 44: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 57
	i64 2145898162032646099, ; 45: ko/Microsoft.Maui.Controls.resources => 0x1dc7c302481e97d3 => 16
	i64 2192948757939169934, ; 46: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 38
	i64 2262844636196693701, ; 47: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 75
	i64 2287834202362508563, ; 48: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 96
	i64 2302323944321350744, ; 49: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 50: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 78
	i64 2335503487726329082, ; 51: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 149
	i64 2405413894731521496, ; 52: da/Microsoft.Maui.Controls.resources => 0x2161bf315d42ddd8 => 3
	i64 2470498323731680442, ; 53: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 71
	i64 2492380397191429704, ; 54: cs/Microsoft.Maui.Controls.resources => 0x2296b6c41bbdfe48 => 2
	i64 2497223385847772520, ; 55: System.Runtime => 0x22a7eb7046413568 => 145
	i64 2547086958574651984, ; 56: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 66
	i64 2656907746661064104, ; 57: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 45
	i64 3017704767998173186, ; 58: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 91
	i64 3107556380337382748, ; 59: pt/Microsoft.Maui.Controls.resources => 0x2b2042103982255c => 22
	i64 3202009568827554833, ; 60: th/Microsoft.Maui.Controls.resources => 0x2c6fd2bce55e3c11 => 27
	i64 3289520064315143713, ; 61: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 77
	i64 3311221304742556517, ; 62: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 127
	i64 3325875462027654285, ; 63: System.Runtime.Numerics => 0x2e27e21c8958b48d => 142
	i64 3344514922410554693, ; 64: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 93
	i64 3429672777697402584, ; 65: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 55
	i64 3494946837667399002, ; 66: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 43
	i64 3522470458906976663, ; 67: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 88
	i64 3523004241079211829, ; 68: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 42
	i64 3551103847008531295, ; 69: System.Private.CoreLib.dll => 0x31480e226177735f => 161
	i64 3571415421602489686, ; 70: System.Runtime.dll => 0x319037675df7e556 => 145
	i64 3638003163729360188, ; 71: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 44
	i64 3647754201059316852, ; 72: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 157
	i64 3655542548057982301, ; 73: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 43
	i64 3716579019761409177, ; 74: netstandard.dll => 0x3393f0ed5c8c5c99 => 160
	i64 3727469159507183293, ; 75: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 86
	i64 3869221888984012293, ; 76: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 48
	i64 3869649043256705283, ; 77: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 109
	i64 3890352374528606784, ; 78: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 53
	i64 3933965368022646939, ; 79: System.Net.Requests => 0x369840a8bfadc09b => 126
	i64 3966267475168208030, ; 80: System.Memory => 0x370b03412596249e => 122
	i64 4009997192427317104, ; 81: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 144
	i64 4073500526318903918, ; 82: System.Private.Xml.dll => 0x3887fb25779ae26e => 131
	i64 4154383907710350974, ; 83: System.ComponentModel => 0x39a7562737acb67e => 104
	i64 4187479170553454871, ; 84: System.Linq.Expressions => 0x3a1cea1e912fa117 => 119
	i64 4205801962323029395, ; 85: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 103
	i64 4337444564132831293, ; 86: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 62
	i64 4356591372459378815, ; 87: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4513320955448359355, ; 88: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 39
	i64 4612482779465751747, ; 89: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 38
	i64 4679594760078841447, ; 90: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4743821336939966868, ; 91: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 101
	i64 4794310189461587505, ; 92: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 66
	i64 4795410492532947900, ; 93: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 88
	i64 4809057822547766521, ; 94: System.Drawing => 0x42bd349c3145ecf9 => 113
	i64 4835744211636393215, ; 95: fi/Microsoft.Maui.Controls.resources => 0x431c03bd573d14ff => 7
	i64 4853321196694829351, ; 96: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 141
	i64 5081566143765835342, ; 97: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 137
	i64 5099468265966638712, ; 98: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 137
	i64 5103417709280584325, ; 99: System.Collections.Specialized => 0x46d2fb5e161b6285 => 99
	i64 5129462924058778861, ; 100: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 36
	i64 5182934613077526976, ; 101: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 99
	i64 5290786973231294105, ; 102: System.Runtime.Loader => 0x496ca6b869b72699 => 141
	i64 5334137958787756892, ; 103: System.Reactive.Linq.dll => 0x4a06aa364878b35c => 60
	i64 5423376490970181369, ; 104: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 139
	i64 5446034149219586269, ; 105: System.Diagnostics.Debug => 0x4b94333452e150dd => 107
	i64 5570799893513421663, ; 106: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 116
	i64 5573260873512690141, ; 107: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 146
	i64 5692067934154308417, ; 108: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 90
	i64 5939174725034091446, ; 109: pt-BR/Microsoft.Maui.Controls.resources => 0x526c2ff200a2a3b6 => 21
	i64 6068057819846744445, ; 110: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 111: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 62
	i64 6222399776351216807, ; 112: System.Text.Json.dll => 0x565a67a0ffe264a7 => 150
	i64 6251069312384999852, ; 113: System.Transactions.Local => 0x56c0426b870da1ac => 155
	i64 6284145129771520194, ; 114: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 132
	i64 6357457916754632952, ; 115: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 116: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 78
	i64 6548213210057960872, ; 117: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 74
	i64 6560151584539558821, ; 118: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 50
	i64 6710414900318471453, ; 119: System.Reactive.Interfaces.dll => 0x5d202ecc6cf8851d => 59
	i64 6734140735192831707, ; 120: uk/Microsoft.Maui.Controls.resources => 0x5d747951d4a816db => 29
	i64 6777482997383978746, ; 121: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 122: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 110
	i64 6814185388980153342, ; 123: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 124: System.Xml.Linq => 0x5f6f85a57d108914 => 156
	i64 6894844156784520562, ; 125: System.Numerics.Vectors => 0x5faf683aead1ad72 => 127
	i64 7046697327704092548, ; 126: System.Reactive.Interfaces => 0x61cae5e2717f2f84 => 59
	i64 7083547580668757502, ; 127: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 130
	i64 7220009545223068405, ; 128: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 129: System.Linq => 0x64e71ccf51a90a5a => 121
	i64 7338192458477945005, ; 130: System.Reflection => 0x65d67f295d0740ad => 136
	i64 7377312882064240630, ; 131: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 103
	i64 7439799228237803094, ; 132: it/Microsoft.Maui.Controls.resources => 0x673f79faf756ee56 => 14
	i64 7488575175965059935, ; 133: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 156
	i64 7489048572193775167, ; 134: System.ObjectModel => 0x67ee71ff6b419e3f => 128
	i64 7642002156153824904, ; 135: ro/Microsoft.Maui.Controls.resources => 0x6a0dd878d2516688 => 23
	i64 7654504624184590948, ; 136: System.Net.Http => 0x6a3a4366801b8264 => 123
	i64 7708790323521193081, ; 137: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 138: System.Private.CoreLib => 0x6b0ff375198b9c17 => 161
	i64 7735176074855944702, ; 139: Microsoft.CSharp => 0x6b58dda848e391fe => 95
	i64 7735352534559001595, ; 140: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 92
	i64 7836164640616011524, ; 141: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 68
	i64 7972383140441761405, ; 142: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 41
	i64 8064050204834738623, ; 143: System.Collections.dll => 0x6fe942efa61731bf => 100
	i64 8083354569033831015, ; 144: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 77
	i64 8087206902342787202, ; 145: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 108
	i64 8113615946733131500, ; 146: System.Reflection.Extensions => 0x70995ab73cf916ec => 134
	i64 8167236081217502503, ; 147: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 162
	i64 8185542183669246576, ; 148: System.Collections => 0x7198e33f4794aa70 => 100
	i64 8246048515196606205, ; 149: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 56
	i64 8290740647658429042, ; 150: System.Runtime.Extensions => 0x730ea0b15c929a72 => 138
	i64 8368701292315763008, ; 151: System.Security.Cryptography => 0x7423997c6fd56140 => 146
	i64 8400357532724379117, ; 152: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 85
	i64 8410671156615598628, ; 153: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 133
	i64 8470680757392014285, ; 154: System.Reactive.Linq => 0x758de744ee167bcd => 60
	i64 8515752553183989521, ; 155: el/Microsoft.Maui.Controls.resources => 0x762e07d427a84f11 => 5
	i64 8518412311883997971, ; 156: System.Collections.Immutable => 0x76377add7c28e313 => 97
	i64 8557640666902467377, ; 157: tr/Microsoft.Maui.Controls.resources => 0x76c2d8d8a2289331 => 28
	i64 8562358305470590539, ; 158: System.Reactive.PlatformServices.dll => 0x76d39b837530ae4b => 61
	i64 8563666267364444763, ; 159: System.Private.Uri => 0x76d841191140ca5b => 129
	i64 8573305974629105867, ; 160: sk/Microsoft.Maui.Controls.resources => 0x76fa805c508080cb => 25
	i64 8614108721271900878, ; 161: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 162: Java.Interop => 0x77b654e585b55834 => 162
	i64 8638972117149407195, ; 163: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 95
	i64 8639588376636138208, ; 164: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 84
	i64 8725526185868997716, ; 165: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 108
	i64 8906941675023136603, ; 166: he/Microsoft.Maui.Controls.resources => 0x7b9bd0432ee0775b => 9
	i64 8941376889969657626, ; 167: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 9020037700568894461, ; 168: System.Reactive.Core => 0x7d2d9c7f9b0a4bfd => 58
	i64 9111603110219107042, ; 169: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 42
	i64 9250544137016314866, ; 170: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 37
	i64 9312692141327339315, ; 171: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 90
	i64 9324707631942237306, ; 172: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 67
	i64 9419392115832876195, ; 173: System.Reactive.PlatformServices => 0x82b8673928556ca3 => 61
	i64 9584643793929893533, ; 174: System.IO.dll => 0x85037ebfbbd7f69d => 118
	i64 9659729154652888475, ; 175: System.Text.RegularExpressions => 0x860e407c9991dd9b => 151
	i64 9678050649315576968, ; 176: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 71
	i64 9702891218465930390, ; 177: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 98
	i64 9808709177481450983, ; 178: Mono.Android.dll => 0x881f890734e555e7 => 164
	i64 9864956466380592553, ; 179: Microsoft.EntityFrameworkCore.Sqlite => 0x88e75da3af4ed5a9 => 40
	i64 9884103019517044980, ; 180: hi/Microsoft.Maui.Controls.resources => 0x892b6353f9ade8f4 => 10
	i64 9933555792566666578, ; 181: System.Linq.Queryable.dll => 0x89db145cf475c552 => 120
	i64 9956195530459977388, ; 182: Microsoft.Maui => 0x8a2b8315b36616ac => 54
	i64 9991543690424095600, ; 183: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 184: System.Net.Http.dll => 0x8b50e941206af13b => 123
	i64 10051358222726253779, ; 185: System.Private.Xml => 0x8b7d990c97ccccd3 => 131
	i64 10092835686693276772, ; 186: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 52
	i64 10226489408795347955, ; 187: sv/Microsoft.Maui.Controls.resources => 0x8debc9ef5e8a8bf3 => 26
	i64 10229024438826829339, ; 188: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 74
	i64 10245369515835430794, ; 189: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 133
	i64 10360651442923773544, ; 190: System.Text.Encoding => 0x8fc86d98211c1e68 => 148
	i64 10364469296367737616, ; 191: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 132
	i64 10406448008575299332, ; 192: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 93
	i64 10430153318873392755, ; 193: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 72
	i64 10566960649245365243, ; 194: System.Globalization.dll => 0x92a562b96dcd13fb => 115
	i64 10714184849103829812, ; 195: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 138
	i64 10785150219063592792, ; 196: System.Net.Primitives => 0x95ac8cfb68830758 => 125
	i64 10811915265162633087, ; 197: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 39
	i64 10822644899632537592, ; 198: System.Linq.Queryable => 0x9631c23204ca5ff8 => 120
	i64 10964653383833615866, ; 199: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 111
	i64 10984274332520666918, ; 200: zh-Hant/Microsoft.Maui.Controls.resources => 0x986ffb4ee955d726 => 33
	i64 11002576679268595294, ; 201: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 49
	i64 11009005086950030778, ; 202: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 54
	i64 11128133081269842136, ; 203: vi/Microsoft.Maui.Controls.resources => 0x9a6f1213fa5cb0d8 => 30
	i64 11150130305267896488, ; 204: zh-Hans/Microsoft.Maui.Controls.resources => 0x9abd386fcccf90a8 => 32
	i64 11162124722117608902, ; 205: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 89
	i64 11226290749488709958, ; 206: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 50
	i64 11340910727871153756, ; 207: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 73
	i64 11398376662953476300, ; 208: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x9e2f2b2f0b71c0cc => 40
	i64 11485890710487134646, ; 209: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 140
	i64 11529969570048099689, ; 210: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 89
	i64 11530571088791430846, ; 211: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 48
	i64 11597940890313164233, ; 212: netstandard => 0xa0f429ca8d1805c9 => 160
	i64 11705530742807338875, ; 213: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11743665907891708234, ; 214: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 152
	i64 11888774080858266727, ; 215: hu/Microsoft.Maui.Controls.resources => 0xa4fd6909806d9c67 => 12
	i64 12123043025855404482, ; 216: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 134
	i64 12124060477258521817, ; 217: id/Microsoft.Maui.Controls.resources => 0xa84150c49e58dcd9 => 13
	i64 12145679461940342714, ; 218: System.Text.Json => 0xa88e1f1ebcb62fba => 150
	i64 12201331334810686224, ; 219: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 144
	i64 12269460666702402136, ; 220: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 97
	i64 12279246230491828964, ; 221: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 65
	i64 12451044538927396471, ; 222: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 76
	i64 12466513435562512481, ; 223: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 81
	i64 12475113361194491050, ; 224: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 225: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 110
	i64 12533156002265635263, ; 226: ru/Microsoft.Maui.Controls.resources => 0xadeeb6fb059919bf => 24
	i64 12538491095302438457, ; 227: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 69
	i64 12550732019250633519, ; 228: System.IO.Compression => 0xae2d28465e8e1b2f => 117
	i64 12681088699309157496, ; 229: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 230: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 70
	i64 12708238894395270091, ; 231: System.IO => 0xb05cbbf17d3ba3cb => 118
	i64 12708922737231849740, ; 232: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 147
	i64 12823819093633476069, ; 233: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 234: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 51
	i64 13068258254871114833, ; 235: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 143
	i64 13221551921002590604, ; 236: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 237: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13239674268801700939, ; 238: ca/Microsoft.Maui.Controls.resources => 0xb7bcc599c5ce144b => 1
	i64 13343850469010654401, ; 239: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 163
	i64 13465488254036897740, ; 240: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 92
	i64 13467053111158216594, ; 241: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13545416393490209236, ; 242: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 243: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 86
	i64 13702626353344114072, ; 244: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 109
	i64 13713329104121190199, ; 245: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 114
	i64 13717397318615465333, ; 246: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 102
	i64 13755568601956062840, ; 247: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 248: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 249: System.Console.dll => 0xc0a5f3cade5c6774 => 105
	i64 13955418299340266673, ; 250: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 47
	i64 13959074834287824816, ; 251: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 76
	i64 14100563506285742564, ; 252: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 253: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 69
	i64 14125464355221830302, ; 254: System.Threading.dll => 0xc407bafdbc707a9e => 154
	i64 14133832980772275001, ; 255: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 37
	i64 14254574811015963973, ; 256: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 147
	i64 14298537385006142420, ; 257: IMS_CGM_Mobile_App.dll => 0xc66e9bfea8ef13d4 => 94
	i64 14327695147300244862, ; 258: System.Reflection.dll => 0xc6d632d338eb4d7e => 136
	i64 14461014870687870182, ; 259: System.Net.Requests.dll => 0xc8afd8683afdece6 => 126
	i64 14522721392235705434, ; 260: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 261: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 149
	i64 14622043554576106986, ; 262: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 143
	i64 14669215534098758659, ; 263: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 45
	i64 14852515768018889994, ; 264: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 73
	i64 14892012299694389861, ; 265: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14954917835170835695, ; 266: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 46
	i64 14987728460634540364, ; 267: System.IO.Compression.dll => 0xcfff1ba06622494c => 117
	i64 15076659072870671916, ; 268: System.ObjectModel.dll => 0xd13b0d8c1620662c => 128
	i64 15115185479366240210, ; 269: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 116
	i64 15133485256822086103, ; 270: System.Linq.dll => 0xd204f0a9127dd9d7 => 121
	i64 15227001540531775957, ; 271: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 44
	i64 15234786388537674379, ; 272: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 114
	i64 15273147323526128252, ; 273: de/Microsoft.Maui.Controls.resources => 0xd3f51e91f4fba27c => 4
	i64 15370334346939861994, ; 274: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 72
	i64 15391712275433856905, ; 275: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 46
	i64 15443314347085689186, ; 276: nl/Microsoft.Maui.Controls.resources => 0xd651ac9394bc7162 => 19
	i64 15474781042002767710, ; 277: hr/Microsoft.Maui.Controls.resources => 0xd6c1775e69862f5e => 11
	i64 15478373401424648762, ; 278: es/Microsoft.Maui.Controls.resources => 0xd6ce3a99c4c55a3a => 6
	i64 15526743539506359484, ; 279: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 148
	i64 15527772828719725935, ; 280: System.Console => 0xd77dbb1e38cd3d6f => 105
	i64 15582737692548360875, ; 281: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 80
	i64 15609085926864131306, ; 282: System.dll => 0xd89e9cf3334914ea => 159
	i64 15620595871140898079, ; 283: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 47
	i64 15661133872274321916, ; 284: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 157
	i64 15664356999916475676, ; 285: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 286: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15817206913877585035, ; 287: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 152
	i64 15995174293784908801, ; 288: nb/Microsoft.Maui.Controls.resources => 0xddfa46462d825401 => 18
	i64 16018552496348375205, ; 289: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 124
	i64 16154507427712707110, ; 290: System => 0xe03056ea4e39aa26 => 159
	i64 16198848395322856833, ; 291: ms/Microsoft.Maui.Controls.resources => 0xe0cddeca55a01581 => 17
	i64 16266187189082433806, ; 292: System.Reactive.Core.dll => 0xe1bd1b110744a90e => 58
	i64 16321164108206115771, ; 293: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 49
	i64 16454459195343277943, ; 294: System.Net.NetworkInformation => 0xe459fb756d988f77 => 124
	i64 16491294355724214223, ; 295: zh-HK/Microsoft.Maui.Controls.resources => 0xe4dcd8d787589fcf => 31
	i64 16581642860983284673, ; 296: Firebase.Database.dll => 0xe61dd454294cf3c1 => 35
	i64 16649148416072044166, ; 297: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 56
	i64 16677317093839702854, ; 298: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 85
	i64 16737304880976948124, ; 299: ja/Microsoft.Maui.Controls.resources => 0xe846da1c780aeb9c => 15
	i64 16755018182064898362, ; 300: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 63
	i64 16856067890322379635, ; 301: System.Data.Common.dll => 0xe9ecc87060889373 => 106
	i64 16890310621557459193, ; 302: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 151
	i64 16998075588627545693, ; 303: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 83
	i64 17008137082415910100, ; 304: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 98
	i64 17031351772568316411, ; 305: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 82
	i64 17062143951396181894, ; 306: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 102
	i64 17089008752050867324, ; 307: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17124332465397484985, ; 308: Firebase.Database => 0xeda5d9a60fb4cdb9 => 35
	i64 17187273293601214786, ; 309: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 101
	i64 17230721278011714856, ; 310: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 130
	i64 17234219099804750107, ; 311: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 155
	i64 17260702271250283638, ; 312: System.Data.Common => 0xef8a5543bba6bc76 => 106
	i64 17333249706306540043, ; 313: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 111
	i64 17438153253682247751, ; 314: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17482873938501421891, ; 315: fr/Microsoft.Maui.Controls.resources => 0xf29fa538054fcb43 => 8
	i64 17627500474728259406, ; 316: System.Globalization => 0xf4a176498a351f4e => 115
	i64 17685921127322830888, ; 317: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 107
	i64 17702523067201099846, ; 318: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 319: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 81
	i64 17710060891934109755, ; 320: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 79
	i64 17712670374920797664, ; 321: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 140
	i64 17777860260071588075, ; 322: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 142
	i64 18017743553296241350, ; 323: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 41
	i64 18025913125965088385, ; 324: System.Threading => 0xfa28e87b91334681 => 154
	i64 18099568558057551825, ; 325: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 326: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 82
	i64 18245806341561545090, ; 327: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 96
	i64 18305135509493619199, ; 328: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 84
	i64 18370042311372477656 ; 329: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 64
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [330 x i32] [
	i32 51, ; 0
	i32 164, ; 1
	i32 55, ; 2
	i32 119, ; 3
	i32 70, ; 4
	i32 87, ; 5
	i32 7, ; 6
	i32 135, ; 7
	i32 153, ; 8
	i32 104, ; 9
	i32 94, ; 10
	i32 10, ; 11
	i32 64, ; 12
	i32 75, ; 13
	i32 135, ; 14
	i32 0, ; 15
	i32 91, ; 16
	i32 18, ; 17
	i32 113, ; 18
	i32 63, ; 19
	i32 83, ; 20
	i32 125, ; 21
	i32 52, ; 22
	i32 163, ; 23
	i32 65, ; 24
	i32 153, ; 25
	i32 16, ; 26
	i32 68, ; 27
	i32 80, ; 28
	i32 20, ; 29
	i32 36, ; 30
	i32 57, ; 31
	i32 122, ; 32
	i32 129, ; 33
	i32 67, ; 34
	i32 139, ; 35
	i32 87, ; 36
	i32 112, ; 37
	i32 53, ; 38
	i32 28, ; 39
	i32 79, ; 40
	i32 2, ; 41
	i32 20, ; 42
	i32 112, ; 43
	i32 57, ; 44
	i32 16, ; 45
	i32 38, ; 46
	i32 75, ; 47
	i32 96, ; 48
	i32 24, ; 49
	i32 78, ; 50
	i32 149, ; 51
	i32 3, ; 52
	i32 71, ; 53
	i32 2, ; 54
	i32 145, ; 55
	i32 66, ; 56
	i32 45, ; 57
	i32 91, ; 58
	i32 22, ; 59
	i32 27, ; 60
	i32 77, ; 61
	i32 127, ; 62
	i32 142, ; 63
	i32 93, ; 64
	i32 55, ; 65
	i32 43, ; 66
	i32 88, ; 67
	i32 42, ; 68
	i32 161, ; 69
	i32 145, ; 70
	i32 44, ; 71
	i32 157, ; 72
	i32 43, ; 73
	i32 160, ; 74
	i32 86, ; 75
	i32 48, ; 76
	i32 109, ; 77
	i32 53, ; 78
	i32 126, ; 79
	i32 122, ; 80
	i32 144, ; 81
	i32 131, ; 82
	i32 104, ; 83
	i32 119, ; 84
	i32 103, ; 85
	i32 62, ; 86
	i32 30, ; 87
	i32 39, ; 88
	i32 38, ; 89
	i32 0, ; 90
	i32 101, ; 91
	i32 66, ; 92
	i32 88, ; 93
	i32 113, ; 94
	i32 7, ; 95
	i32 141, ; 96
	i32 137, ; 97
	i32 137, ; 98
	i32 99, ; 99
	i32 36, ; 100
	i32 99, ; 101
	i32 141, ; 102
	i32 60, ; 103
	i32 139, ; 104
	i32 107, ; 105
	i32 116, ; 106
	i32 146, ; 107
	i32 90, ; 108
	i32 21, ; 109
	i32 23, ; 110
	i32 62, ; 111
	i32 150, ; 112
	i32 155, ; 113
	i32 132, ; 114
	i32 34, ; 115
	i32 78, ; 116
	i32 74, ; 117
	i32 50, ; 118
	i32 59, ; 119
	i32 29, ; 120
	i32 22, ; 121
	i32 110, ; 122
	i32 158, ; 123
	i32 156, ; 124
	i32 127, ; 125
	i32 59, ; 126
	i32 130, ; 127
	i32 26, ; 128
	i32 121, ; 129
	i32 136, ; 130
	i32 103, ; 131
	i32 14, ; 132
	i32 156, ; 133
	i32 128, ; 134
	i32 23, ; 135
	i32 123, ; 136
	i32 17, ; 137
	i32 161, ; 138
	i32 95, ; 139
	i32 92, ; 140
	i32 68, ; 141
	i32 41, ; 142
	i32 100, ; 143
	i32 77, ; 144
	i32 108, ; 145
	i32 134, ; 146
	i32 162, ; 147
	i32 100, ; 148
	i32 56, ; 149
	i32 138, ; 150
	i32 146, ; 151
	i32 85, ; 152
	i32 133, ; 153
	i32 60, ; 154
	i32 5, ; 155
	i32 97, ; 156
	i32 28, ; 157
	i32 61, ; 158
	i32 129, ; 159
	i32 25, ; 160
	i32 21, ; 161
	i32 162, ; 162
	i32 95, ; 163
	i32 84, ; 164
	i32 108, ; 165
	i32 9, ; 166
	i32 158, ; 167
	i32 58, ; 168
	i32 42, ; 169
	i32 37, ; 170
	i32 90, ; 171
	i32 67, ; 172
	i32 61, ; 173
	i32 118, ; 174
	i32 151, ; 175
	i32 71, ; 176
	i32 98, ; 177
	i32 164, ; 178
	i32 40, ; 179
	i32 10, ; 180
	i32 120, ; 181
	i32 54, ; 182
	i32 6, ; 183
	i32 123, ; 184
	i32 131, ; 185
	i32 52, ; 186
	i32 26, ; 187
	i32 74, ; 188
	i32 133, ; 189
	i32 148, ; 190
	i32 132, ; 191
	i32 93, ; 192
	i32 72, ; 193
	i32 115, ; 194
	i32 138, ; 195
	i32 125, ; 196
	i32 39, ; 197
	i32 120, ; 198
	i32 111, ; 199
	i32 33, ; 200
	i32 49, ; 201
	i32 54, ; 202
	i32 30, ; 203
	i32 32, ; 204
	i32 89, ; 205
	i32 50, ; 206
	i32 73, ; 207
	i32 40, ; 208
	i32 140, ; 209
	i32 89, ; 210
	i32 48, ; 211
	i32 160, ; 212
	i32 9, ; 213
	i32 152, ; 214
	i32 12, ; 215
	i32 134, ; 216
	i32 13, ; 217
	i32 150, ; 218
	i32 144, ; 219
	i32 97, ; 220
	i32 65, ; 221
	i32 76, ; 222
	i32 81, ; 223
	i32 34, ; 224
	i32 110, ; 225
	i32 24, ; 226
	i32 69, ; 227
	i32 117, ; 228
	i32 14, ; 229
	i32 70, ; 230
	i32 118, ; 231
	i32 147, ; 232
	i32 27, ; 233
	i32 51, ; 234
	i32 143, ; 235
	i32 1, ; 236
	i32 15, ; 237
	i32 1, ; 238
	i32 163, ; 239
	i32 92, ; 240
	i32 29, ; 241
	i32 13, ; 242
	i32 86, ; 243
	i32 109, ; 244
	i32 114, ; 245
	i32 102, ; 246
	i32 8, ; 247
	i32 11, ; 248
	i32 105, ; 249
	i32 47, ; 250
	i32 76, ; 251
	i32 3, ; 252
	i32 69, ; 253
	i32 154, ; 254
	i32 37, ; 255
	i32 147, ; 256
	i32 94, ; 257
	i32 136, ; 258
	i32 126, ; 259
	i32 5, ; 260
	i32 149, ; 261
	i32 143, ; 262
	i32 45, ; 263
	i32 73, ; 264
	i32 33, ; 265
	i32 46, ; 266
	i32 117, ; 267
	i32 128, ; 268
	i32 116, ; 269
	i32 121, ; 270
	i32 44, ; 271
	i32 114, ; 272
	i32 4, ; 273
	i32 72, ; 274
	i32 46, ; 275
	i32 19, ; 276
	i32 11, ; 277
	i32 6, ; 278
	i32 148, ; 279
	i32 105, ; 280
	i32 80, ; 281
	i32 159, ; 282
	i32 47, ; 283
	i32 157, ; 284
	i32 4, ; 285
	i32 12, ; 286
	i32 152, ; 287
	i32 18, ; 288
	i32 124, ; 289
	i32 159, ; 290
	i32 17, ; 291
	i32 58, ; 292
	i32 49, ; 293
	i32 124, ; 294
	i32 31, ; 295
	i32 35, ; 296
	i32 56, ; 297
	i32 85, ; 298
	i32 15, ; 299
	i32 63, ; 300
	i32 106, ; 301
	i32 151, ; 302
	i32 83, ; 303
	i32 98, ; 304
	i32 82, ; 305
	i32 102, ; 306
	i32 32, ; 307
	i32 35, ; 308
	i32 101, ; 309
	i32 130, ; 310
	i32 155, ; 311
	i32 106, ; 312
	i32 111, ; 313
	i32 25, ; 314
	i32 8, ; 315
	i32 115, ; 316
	i32 107, ; 317
	i32 31, ; 318
	i32 81, ; 319
	i32 79, ; 320
	i32 140, ; 321
	i32 142, ; 322
	i32 41, ; 323
	i32 154, ; 324
	i32 19, ; 325
	i32 82, ; 326
	i32 96, ; 327
	i32 84, ; 328
	i32 64 ; 329
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
