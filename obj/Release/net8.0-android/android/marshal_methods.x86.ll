; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [165 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [330 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 124
	i32 26230656, ; 1: Microsoft.Extensions.DependencyModel => 0x1903f80 => 47
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 57
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 153
	i32 53857724, ; 4: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 1
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 56
	i32 113429830, ; 6: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 31
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 140
	i32 159306688, ; 8: System.ComponentModel.Annotations => 0x97ed3c0 => 101
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 88
	i32 195452805, ; 11: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 12: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 104
	i32 220171995, ; 14: System.Diagnostics.Debug => 0xd1f8edb => 107
	i32 230752869, ; 15: Microsoft.CSharp.dll => 0xdc10265 => 95
	i32 231814094, ; 16: System.Globalization => 0xdd133ce => 115
	i32 246610117, ; 17: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 133
	i32 280992041, ; 18: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 318968648, ; 19: Xamarin.AndroidX.Activity.dll => 0x13031348 => 66
	i32 336156722, ; 20: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 21: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 347068432, ; 22: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 64
	i32 356389973, ; 23: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 357576608, ; 24: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 2
	i32 374914964, ; 25: System.Transactions.Local => 0x1658bf94 => 155
	i32 379916513, ; 26: System.Threading.Thread.dll => 0x16a510e1 => 153
	i32 385762202, ; 27: System.Memory.dll => 0x16fe439a => 122
	i32 395744057, ; 28: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 29: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 30: System.Collections => 0x1a61054f => 100
	i32 450948140, ; 31: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 459347974, ; 32: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 144
	i32 469710990, ; 33: System.dll => 0x1bff388e => 159
	i32 498788369, ; 34: System.ObjectModel => 0x1dbae811 => 128
	i32 500358224, ; 35: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 36: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 37: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 51
	i32 527168573, ; 38: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 10
	i32 530272170, ; 39: System.Linq.Queryable => 0x1f9b4faa => 120
	i32 539058512, ; 40: Microsoft.Extensions.Logging => 0x20216150 => 48
	i32 545304856, ; 41: System.Runtime.Extensions => 0x2080b118 => 138
	i32 592146354, ; 42: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 43: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 662205335, ; 44: System.Text.Encodings.Web.dll => 0x27787397 => 149
	i32 672442732, ; 45: System.Collections.Concurrent => 0x2814a96c => 96
	i32 688181140, ; 46: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 47: System.Xml.Linq.dll => 0x29293ff5 => 156
	i32 706645707, ; 48: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 49: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 50: System.Runtime.Loader.dll => 0x2b15ed29 => 141
	i32 748832960, ; 51: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 62
	i32 759454413, ; 52: System.Net.Requests => 0x2d445acd => 126
	i32 775507847, ; 53: System.IO.Compression => 0x2e394f87 => 117
	i32 789151979, ; 54: Microsoft.Extensions.Options => 0x2f0980eb => 50
	i32 804715423, ; 55: System.Data.Common => 0x2ff6fb9f => 106
	i32 823281589, ; 56: System.Private.Uri.dll => 0x311247b5 => 129
	i32 830298997, ; 57: System.IO.Compression.Brotli => 0x317d5b75 => 116
	i32 831745141, ; 58: System.Reactive.Linq => 0x31936c75 => 60
	i32 870878177, ; 59: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 0
	i32 877678880, ; 60: System.Globalization.dll => 0x34505120 => 115
	i32 904024072, ; 61: System.ComponentModel.Primitives.dll => 0x35e25008 => 102
	i32 926902833, ; 62: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 63: Newtonsoft.Json => 0x38f24a24 => 57
	i32 967690846, ; 64: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 975236339, ; 65: System.Diagnostics.Tracing => 0x3a20ecf3 => 111
	i32 975874589, ; 66: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 987214855, ; 67: System.Diagnostics.Tools => 0x3ad7b407 => 109
	i32 992768348, ; 68: System.Collections.dll => 0x3b2c715c => 100
	i32 993161700, ; 69: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 32
	i32 994547685, ; 70: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 6
	i32 1012816738, ; 71: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 87
	i32 1019214401, ; 72: System.Drawing => 0x3cbffa41 => 113
	i32 1028951442, ; 73: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 46
	i32 1029334545, ; 74: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 75: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 67
	i32 1036536393, ; 76: System.Drawing.Primitives.dll => 0x3dc84a49 => 112
	i32 1044663988, ; 77: System.Linq.Expressions.dll => 0x3e444eb4 => 119
	i32 1052210849, ; 78: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 79: System.ComponentModel.TypeConverter => 0x408b17f4 => 103
	i32 1084122840, ; 80: Xamarin.Kotlin.StdLib => 0x409e66d8 => 92
	i32 1098259244, ; 81: System => 0x41761b2c => 159
	i32 1157931901, ; 82: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 38
	i32 1178241025, ; 83: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 84
	i32 1178797549, ; 84: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 7
	i32 1202000627, ; 85: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 38
	i32 1203215381, ; 86: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 87: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 42
	i32 1234928153, ; 88: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1277757772, ; 89: IMS_CGM_Mobile_App => 0x4c29094c => 94
	i32 1292207520, ; 90: SQLitePCLRaw.core.dll => 0x4d0585a0 => 63
	i32 1293217323, ; 91: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1324164729, ; 92: System.Linq => 0x4eed2679 => 121
	i32 1364015309, ; 93: System.IO => 0x514d38cd => 118
	i32 1376866003, ; 94: Xamarin.AndroidX.SavedState => 0x52114ed3 => 87
	i32 1379779777, ; 95: System.Resources.ResourceManager => 0x523dc4c1 => 137
	i32 1406073936, ; 96: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1408764838, ; 97: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 143
	i32 1453312822, ; 98: System.Diagnostics.Tools.dll => 0x569fcb36 => 109
	i32 1457743152, ; 99: System.Runtime.Extensions.dll => 0x56e36530 => 138
	i32 1461234159, ; 100: System.Collections.Immutable.dll => 0x5718a9ef => 97
	i32 1462112819, ; 101: System.IO.Compression.dll => 0x57261233 => 117
	i32 1469204771, ; 102: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 68
	i32 1470490898, ; 103: Microsoft.Extensions.Primitives => 0x57a5e912 => 51
	i32 1479771757, ; 104: System.Collections.Immutable => 0x5833866d => 97
	i32 1480492111, ; 105: System.IO.Compression.Brotli.dll => 0x583e844f => 116
	i32 1490351284, ; 106: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 36
	i32 1493001747, ; 107: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 108: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 109: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 151
	i32 1550322496, ; 110: System.Reflection.Extensions.dll => 0x5c680b40 => 134
	i32 1551623176, ; 111: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1554762148, ; 112: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 8
	i32 1580413037, ; 113: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 26
	i32 1591080825, ; 114: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 33
	i32 1622152042, ; 115: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1622358360, ; 116: System.Dynamic.Runtime => 0x60b33958 => 114
	i32 1624863272, ; 117: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 90
	i32 1636350590, ; 118: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 119: System.Net.Http.dll => 0x61b9038d => 123
	i32 1639986890, ; 120: System.Text.RegularExpressions => 0x61c036ca => 151
	i32 1657153582, ; 121: System.Runtime => 0x62c6282e => 145
	i32 1658251792, ; 122: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 91
	i32 1677501392, ; 123: System.Net.Primitives.dll => 0x63fca3d0 => 125
	i32 1679769178, ; 124: System.Security.Cryptography => 0x641f3e5a => 146
	i32 1688112883, ; 125: Microsoft.Data.Sqlite => 0x649e8ef3 => 36
	i32 1689493916, ; 126: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 37
	i32 1701541528, ; 127: System.Diagnostics.Debug.dll => 0x656b7698 => 107
	i32 1711441057, ; 128: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 64
	i32 1726116996, ; 129: System.Reflection.dll => 0x66e27484 => 136
	i32 1729485958, ; 130: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1736233607, ; 131: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1744735666, ; 132: System.Transactions.Local.dll => 0x67fe8db2 => 155
	i32 1763938596, ; 133: System.Diagnostics.TraceSource.dll => 0x69239124 => 110
	i32 1765942094, ; 134: System.Reflection.Extensions => 0x6942234e => 134
	i32 1766324549, ; 135: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 88
	i32 1770582343, ; 136: Microsoft.Extensions.Logging.dll => 0x6988f147 => 48
	i32 1780572499, ; 137: Mono.Android.Runtime.dll => 0x6a216153 => 163
	i32 1788241197, ; 138: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1808609942, ; 139: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1809966115, ; 140: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 18
	i32 1813058853, ; 141: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 92
	i32 1813201214, ; 142: Xamarin.Google.Android.Material => 0x6c13413e => 91
	i32 1818569960, ; 143: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 85
	i32 1821794637, ; 144: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 12
	i32 1824175904, ; 145: System.Text.Encoding.Extensions => 0x6cbab720 => 147
	i32 1824722060, ; 146: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 143
	i32 1828688058, ; 147: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 49
	i32 1842015223, ; 148: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1858542181, ; 149: System.Linq.Expressions => 0x6ec71a65 => 119
	i32 1870277092, ; 150: System.Reflection.Primitives => 0x6f7a29e4 => 135
	i32 1886040351, ; 151: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 40
	i32 1900610850, ; 152: System.Resources.ResourceManager.dll => 0x71490522 => 137
	i32 1910275211, ; 153: System.Collections.NonGeneric.dll => 0x71dc7c8b => 98
	i32 1939592360, ; 154: System.Private.Xml.Linq => 0x739bd4a8 => 130
	i32 1960264639, ; 155: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 15
	i32 1968388702, ; 156: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 43
	i32 2014344398, ; 157: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 11
	i32 2014489277, ; 158: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 40
	i32 2019465201, ; 159: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2025202353, ; 160: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2043674646, ; 161: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 14
	i32 2045470958, ; 162: System.Private.Xml => 0x79eb68ee => 131
	i32 2055257422, ; 163: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2070888862, ; 164: System.Diagnostics.TraceSource => 0x7b6f419e => 110
	i32 2079903147, ; 165: System.Runtime.dll => 0x7bf8cdab => 145
	i32 2090596640, ; 166: System.Numerics.Vectors => 0x7c9bf920 => 127
	i32 2103459038, ; 167: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 65
	i32 2127167465, ; 168: System.Console => 0x7ec9ffe9 => 105
	i32 2142473426, ; 169: System.Collections.Specialized => 0x7fb38cd2 => 99
	i32 2150663486, ; 170: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 16
	i32 2159891885, ; 171: Microsoft.Maui => 0x80bd55ad => 54
	i32 2165051842, ; 172: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 23
	i32 2181898931, ; 173: Microsoft.Extensions.Options.dll => 0x820d22b3 => 50
	i32 2192057212, ; 174: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 49
	i32 2193016926, ; 175: System.ObjectModel.dll => 0x82b6c85e => 128
	i32 2197979891, ; 176: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 47
	i32 2201107256, ; 177: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 93
	i32 2201231467, ; 178: System.Net.Http => 0x8334206b => 123
	i32 2252897993, ; 179: Microsoft.EntityFrameworkCore => 0x86487ec9 => 37
	i32 2266799131, ; 180: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 44
	i32 2268744777, ; 181: Firebase.Database.dll => 0x873a4c49 => 35
	i32 2270573516, ; 182: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 183: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2289298199, ; 184: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 27
	i32 2292630417, ; 185: System.Reactive.PlatformServices.dll => 0x88a6c391 => 61
	i32 2303054758, ; 186: System.Reactive.Interfaces.dll => 0x8945d3a6 => 59
	i32 2305521784, ; 187: System.Private.CoreLib.dll => 0x896b7878 => 161
	i32 2340441535, ; 188: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 139
	i32 2353062107, ; 189: System.Net.Primitives => 0x8c40e0db => 125
	i32 2368005991, ; 190: System.Xml.ReaderWriter.dll => 0x8d24e767 => 157
	i32 2369760409, ; 191: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 28
	i32 2371007202, ; 192: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 43
	i32 2421992093, ; 193: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 19
	i32 2435356389, ; 194: System.Console.dll => 0x912896e5 => 105
	i32 2454642406, ; 195: System.Text.Encoding.dll => 0x924edee6 => 148
	i32 2465273461, ; 196: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 62
	i32 2471841756, ; 197: netstandard.dll => 0x93554fdc => 160
	i32 2475788418, ; 198: Java.Interop.dll => 0x93918882 => 162
	i32 2480646305, ; 199: Microsoft.Maui.Controls => 0x93dba8a1 => 52
	i32 2520433370, ; 200: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 25
	i32 2538310050, ; 201: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 133
	i32 2562349572, ; 202: Microsoft.CSharp => 0x98ba5a04 => 95
	i32 2570120770, ; 203: System.Text.Encodings.Web => 0x9930ee42 => 149
	i32 2585220780, ; 204: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 147
	i32 2605712449, ; 205: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 93
	i32 2617129537, ; 206: System.Private.Xml.dll => 0x9bfe3a41 => 131
	i32 2620871830, ; 207: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2634653062, ; 208: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 39
	i32 2663698177, ; 209: System.Runtime.Loader => 0x9ec4cf01 => 141
	i32 2664396074, ; 210: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 211: System.Drawing.Primitives => 0x9ee22cc0 => 112
	i32 2676780864, ; 212: System.Data.Common.dll => 0x9f8c6f40 => 106
	i32 2693849962, ; 213: System.IO.dll => 0xa090e36a => 118
	i32 2715334215, ; 214: System.Threading.Tasks.dll => 0xa1d8b647 => 152
	i32 2724373263, ; 215: System.Runtime.Numerics.dll => 0xa262a30f => 142
	i32 2732626843, ; 216: Xamarin.AndroidX.Activity => 0xa2e0939b => 66
	i32 2737747696, ; 217: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 68
	i32 2758225723, ; 218: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 53
	i32 2764765095, ; 219: Microsoft.Maui.dll => 0xa4caf7a7 => 54
	i32 2778768386, ; 220: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 89
	i32 2801831435, ; 221: Microsoft.Maui.Graphics => 0xa7008e0b => 56
	i32 2802068195, ; 222: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 29
	i32 2806116107, ; 223: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 224: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2831556043, ; 225: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847789619, ; 226: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 39
	i32 2853208004, ; 227: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 89
	i32 2857259519, ; 228: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 5
	i32 2861189240, ; 229: Microsoft.Maui.Essentials => 0xaa8a4878 => 55
	i32 2883495834, ; 230: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 24
	i32 2900621748, ; 231: System.Dynamic.Runtime.dll => 0xace3f9b4 => 114
	i32 2901442782, ; 232: System.Reflection => 0xacf080de => 136
	i32 2909740682, ; 233: System.Private.CoreLib => 0xad6f1e8a => 161
	i32 2916838712, ; 234: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 90
	i32 2919462931, ; 235: System.Numerics.Vectors.dll => 0xae037813 => 127
	i32 2959614098, ; 236: System.ComponentModel.dll => 0xb0682092 => 104
	i32 2978675010, ; 237: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 3038032645, ; 238: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 239: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 82
	i32 3059408633, ; 240: Mono.Android.Runtime => 0xb65adef9 => 163
	i32 3059793426, ; 241: System.ComponentModel.Primitives => 0xb660be12 => 102
	i32 3069363400, ; 242: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 41
	i32 3075834255, ; 243: System.Threading.Tasks => 0xb755818f => 152
	i32 3077302341, ; 244: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3147165239, ; 245: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 111
	i32 3159123045, ; 246: System.Reflection.Primitives.dll => 0xbc4c6465 => 135
	i32 3178803400, ; 247: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 83
	i32 3195844289, ; 248: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 41
	i32 3220365878, ; 249: System.Threading => 0xbff2e236 => 154
	i32 3258312781, ; 250: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3265493905, ; 251: System.Linq.Queryable.dll => 0xc2a37b91 => 120
	i32 3280506390, ; 252: System.ComponentModel.Annotations.dll => 0xc3888e16 => 101
	i32 3282591531, ; 253: System.Reactive.Interfaces => 0xc3a85f2b => 59
	i32 3299363146, ; 254: System.Text.Encoding => 0xc4a8494a => 148
	i32 3300173928, ; 255: System.Reactive.Core => 0xc4b4a868 => 58
	i32 3316684772, ; 256: System.Net.Requests.dll => 0xc5b097e4 => 126
	i32 3317135071, ; 257: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3346324047, ; 258: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 84
	i32 3358260929, ; 259: System.Text.Json => 0xc82afec1 => 150
	i32 3360279109, ; 260: SQLitePCLRaw.core => 0xc849ca45 => 63
	i32 3362522851, ; 261: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 262: Java.Interop => 0xc8a662e9 => 162
	i32 3374999561, ; 263: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3425410982, ; 264: System.Reactive.Core.dll => 0xcc2b9fa6 => 58
	i32 3428513518, ; 265: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 45
	i32 3430777524, ; 266: netstandard => 0xcc7d82b4 => 160
	i32 3463511458, ; 267: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 268: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 103
	i32 3476120550, ; 269: Mono.Android => 0xcf3163e6 => 164
	i32 3479583265, ; 270: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3485117614, ; 271: System.Text.Json.dll => 0xcfbaacae => 150
	i32 3509114376, ; 272: System.Xml.Linq => 0xd128d608 => 156
	i32 3542658132, ; 273: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 30
	i32 3596930546, ; 274: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 4
	i32 3598349058, ; 275: Firebase.Database => 0xd67a7302 => 35
	i32 3608519521, ; 276: System.Linq.dll => 0xd715a361 => 121
	i32 3623444314, ; 277: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 3
	i32 3624195450, ; 278: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 139
	i32 3641597786, ; 279: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643854240, ; 280: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 83
	i32 3647796983, ; 281: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 21
	i32 3657292374, ; 282: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 44
	i32 3660523487, ; 283: System.Net.NetworkInformation => 0xda2f27df => 124
	i32 3662115805, ; 284: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 9
	i32 3672681054, ; 285: Mono.Android.dll => 0xdae8aa5e => 164
	i32 3686075795, ; 286: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 17
	i32 3697841164, ; 287: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 288: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 82
	i32 3748608112, ; 289: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 108
	i32 3754567612, ; 290: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 65
	i32 3760520151, ; 291: System.Reactive.Linq.dll => 0xe024fbd7 => 60
	i32 3786282454, ; 292: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 293: System.Collections.NonGeneric => 0xe2098b0b => 98
	i32 3802395368, ; 294: System.Collections.Specialized.dll => 0xe2a3f2e8 => 99
	i32 3823082795, ; 295: System.Security.Cryptography.dll => 0xe3df9d2b => 146
	i32 3835113687, ; 296: System.Reactive.PlatformServices => 0xe49730d7 => 61
	i32 3841636137, ; 297: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 46
	i32 3849253459, ; 298: System.Runtime.InteropServices.dll => 0xe56ef253 => 140
	i32 3872668407, ; 299: IMS_CGM_Mobile_App.dll => 0xe6d43af7 => 94
	i32 3889960447, ; 300: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 301: System.Collections.Concurrent.dll => 0xe839deed => 96
	i32 3896760992, ; 302: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3928044579, ; 303: System.Xml.ReaderWriter => 0xea213423 => 157
	i32 3931092270, ; 304: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 85
	i32 3955647286, ; 305: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 67
	i32 3980434154, ; 306: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 307: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 308: System.Memory => 0xeff49a63 => 122
	i32 4046471985, ; 309: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 53
	i32 4054681211, ; 310: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 132
	i32 4068434129, ; 311: System.Private.Xml.Linq.dll => 0xf27f60d1 => 130
	i32 4070331268, ; 312: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 13
	i32 4073602200, ; 313: System.Threading.dll => 0xf2ce3c98 => 154
	i32 4094352644, ; 314: Microsoft.Maui.Essentials.dll => 0xf40add04 => 55
	i32 4099507663, ; 315: System.Drawing.dll => 0xf45985cf => 113
	i32 4100113165, ; 316: System.Private.Uri => 0xf462c30d => 129
	i32 4101842092, ; 317: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 42
	i32 4102112229, ; 318: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4119206479, ; 319: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 20
	i32 4125707920, ; 320: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 321: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 45
	i32 4147896353, ; 322: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 132
	i32 4181436372, ; 323: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 144
	i32 4182413190, ; 324: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4213026141, ; 325: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 108
	i32 4234116406, ; 326: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 22
	i32 4271975918, ; 327: Microsoft.Maui.Controls.dll => 0xfea12dee => 52
	i32 4274976490, ; 328: System.Runtime.Numerics => 0xfecef6ea => 142
	i32 4292120959 ; 329: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [330 x i32] [
	i32 124, ; 0
	i32 47, ; 1
	i32 57, ; 2
	i32 153, ; 3
	i32 1, ; 4
	i32 56, ; 5
	i32 31, ; 6
	i32 140, ; 7
	i32 101, ; 8
	i32 70, ; 9
	i32 88, ; 10
	i32 30, ; 11
	i32 31, ; 12
	i32 104, ; 13
	i32 107, ; 14
	i32 95, ; 15
	i32 115, ; 16
	i32 133, ; 17
	i32 2, ; 18
	i32 66, ; 19
	i32 15, ; 20
	i32 77, ; 21
	i32 64, ; 22
	i32 14, ; 23
	i32 2, ; 24
	i32 155, ; 25
	i32 153, ; 26
	i32 122, ; 27
	i32 34, ; 28
	i32 26, ; 29
	i32 100, ; 30
	i32 76, ; 31
	i32 144, ; 32
	i32 159, ; 33
	i32 128, ; 34
	i32 13, ; 35
	i32 7, ; 36
	i32 51, ; 37
	i32 10, ; 38
	i32 120, ; 39
	i32 48, ; 40
	i32 138, ; 41
	i32 21, ; 42
	i32 74, ; 43
	i32 149, ; 44
	i32 96, ; 45
	i32 1, ; 46
	i32 156, ; 47
	i32 16, ; 48
	i32 4, ; 49
	i32 141, ; 50
	i32 62, ; 51
	i32 126, ; 52
	i32 117, ; 53
	i32 50, ; 54
	i32 106, ; 55
	i32 129, ; 56
	i32 116, ; 57
	i32 60, ; 58
	i32 0, ; 59
	i32 115, ; 60
	i32 102, ; 61
	i32 28, ; 62
	i32 57, ; 63
	i32 77, ; 64
	i32 111, ; 65
	i32 158, ; 66
	i32 109, ; 67
	i32 100, ; 68
	i32 32, ; 69
	i32 6, ; 70
	i32 87, ; 71
	i32 113, ; 72
	i32 46, ; 73
	i32 3, ; 74
	i32 67, ; 75
	i32 112, ; 76
	i32 119, ; 77
	i32 79, ; 78
	i32 103, ; 79
	i32 92, ; 80
	i32 159, ; 81
	i32 38, ; 82
	i32 84, ; 83
	i32 7, ; 84
	i32 38, ; 85
	i32 20, ; 86
	i32 42, ; 87
	i32 18, ; 88
	i32 94, ; 89
	i32 63, ; 90
	i32 75, ; 91
	i32 121, ; 92
	i32 118, ; 93
	i32 87, ; 94
	i32 137, ; 95
	i32 71, ; 96
	i32 143, ; 97
	i32 109, ; 98
	i32 138, ; 99
	i32 97, ; 100
	i32 117, ; 101
	i32 68, ; 102
	i32 51, ; 103
	i32 97, ; 104
	i32 116, ; 105
	i32 36, ; 106
	i32 10, ; 107
	i32 5, ; 108
	i32 151, ; 109
	i32 134, ; 110
	i32 25, ; 111
	i32 8, ; 112
	i32 26, ; 113
	i32 33, ; 114
	i32 81, ; 115
	i32 114, ; 116
	i32 90, ; 117
	i32 73, ; 118
	i32 123, ; 119
	i32 151, ; 120
	i32 145, ; 121
	i32 91, ; 122
	i32 125, ; 123
	i32 146, ; 124
	i32 36, ; 125
	i32 37, ; 126
	i32 107, ; 127
	i32 64, ; 128
	i32 136, ; 129
	i32 69, ; 130
	i32 23, ; 131
	i32 155, ; 132
	i32 110, ; 133
	i32 134, ; 134
	i32 88, ; 135
	i32 48, ; 136
	i32 163, ; 137
	i32 76, ; 138
	i32 81, ; 139
	i32 18, ; 140
	i32 92, ; 141
	i32 91, ; 142
	i32 85, ; 143
	i32 12, ; 144
	i32 147, ; 145
	i32 143, ; 146
	i32 49, ; 147
	i32 29, ; 148
	i32 119, ; 149
	i32 135, ; 150
	i32 40, ; 151
	i32 137, ; 152
	i32 98, ; 153
	i32 130, ; 154
	i32 15, ; 155
	i32 43, ; 156
	i32 11, ; 157
	i32 40, ; 158
	i32 79, ; 159
	i32 0, ; 160
	i32 14, ; 161
	i32 131, ; 162
	i32 78, ; 163
	i32 110, ; 164
	i32 145, ; 165
	i32 127, ; 166
	i32 65, ; 167
	i32 105, ; 168
	i32 99, ; 169
	i32 16, ; 170
	i32 54, ; 171
	i32 23, ; 172
	i32 50, ; 173
	i32 49, ; 174
	i32 128, ; 175
	i32 47, ; 176
	i32 93, ; 177
	i32 123, ; 178
	i32 37, ; 179
	i32 44, ; 180
	i32 35, ; 181
	i32 8, ; 182
	i32 86, ; 183
	i32 27, ; 184
	i32 61, ; 185
	i32 59, ; 186
	i32 161, ; 187
	i32 139, ; 188
	i32 125, ; 189
	i32 157, ; 190
	i32 28, ; 191
	i32 43, ; 192
	i32 19, ; 193
	i32 105, ; 194
	i32 148, ; 195
	i32 62, ; 196
	i32 160, ; 197
	i32 162, ; 198
	i32 52, ; 199
	i32 25, ; 200
	i32 133, ; 201
	i32 95, ; 202
	i32 149, ; 203
	i32 147, ; 204
	i32 93, ; 205
	i32 131, ; 206
	i32 73, ; 207
	i32 39, ; 208
	i32 141, ; 209
	i32 158, ; 210
	i32 112, ; 211
	i32 106, ; 212
	i32 118, ; 213
	i32 152, ; 214
	i32 142, ; 215
	i32 66, ; 216
	i32 68, ; 217
	i32 53, ; 218
	i32 54, ; 219
	i32 89, ; 220
	i32 56, ; 221
	i32 29, ; 222
	i32 6, ; 223
	i32 71, ; 224
	i32 19, ; 225
	i32 39, ; 226
	i32 89, ; 227
	i32 5, ; 228
	i32 55, ; 229
	i32 24, ; 230
	i32 114, ; 231
	i32 136, ; 232
	i32 161, ; 233
	i32 90, ; 234
	i32 127, ; 235
	i32 104, ; 236
	i32 75, ; 237
	i32 34, ; 238
	i32 82, ; 239
	i32 163, ; 240
	i32 102, ; 241
	i32 41, ; 242
	i32 152, ; 243
	i32 12, ; 244
	i32 111, ; 245
	i32 135, ; 246
	i32 83, ; 247
	i32 41, ; 248
	i32 154, ; 249
	i32 69, ; 250
	i32 120, ; 251
	i32 101, ; 252
	i32 59, ; 253
	i32 148, ; 254
	i32 58, ; 255
	i32 126, ; 256
	i32 74, ; 257
	i32 84, ; 258
	i32 150, ; 259
	i32 63, ; 260
	i32 72, ; 261
	i32 162, ; 262
	i32 86, ; 263
	i32 58, ; 264
	i32 45, ; 265
	i32 160, ; 266
	i32 11, ; 267
	i32 103, ; 268
	i32 164, ; 269
	i32 24, ; 270
	i32 150, ; 271
	i32 156, ; 272
	i32 30, ; 273
	i32 4, ; 274
	i32 35, ; 275
	i32 121, ; 276
	i32 3, ; 277
	i32 139, ; 278
	i32 78, ; 279
	i32 83, ; 280
	i32 21, ; 281
	i32 44, ; 282
	i32 124, ; 283
	i32 9, ; 284
	i32 164, ; 285
	i32 17, ; 286
	i32 33, ; 287
	i32 82, ; 288
	i32 108, ; 289
	i32 65, ; 290
	i32 60, ; 291
	i32 70, ; 292
	i32 98, ; 293
	i32 99, ; 294
	i32 146, ; 295
	i32 61, ; 296
	i32 46, ; 297
	i32 140, ; 298
	i32 94, ; 299
	i32 32, ; 300
	i32 96, ; 301
	i32 72, ; 302
	i32 157, ; 303
	i32 85, ; 304
	i32 67, ; 305
	i32 27, ; 306
	i32 9, ; 307
	i32 122, ; 308
	i32 53, ; 309
	i32 132, ; 310
	i32 130, ; 311
	i32 13, ; 312
	i32 154, ; 313
	i32 55, ; 314
	i32 113, ; 315
	i32 129, ; 316
	i32 42, ; 317
	i32 22, ; 318
	i32 20, ; 319
	i32 17, ; 320
	i32 45, ; 321
	i32 132, ; 322
	i32 144, ; 323
	i32 80, ; 324
	i32 108, ; 325
	i32 22, ; 326
	i32 52, ; 327
	i32 142, ; 328
	i32 80 ; 329
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
