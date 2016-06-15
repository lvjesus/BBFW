
一、目录结构
1、	Constants文件夹下面放常量和宏定义
2、	Libs文件夹下面放第三方库
3、	Utils文件夹下面放一些工具类
4、	Models文件夹下面放数据模型类
5、	Requests文件夹下面是请求类
6、	CacheData文件夹下面存放的是数据存储类
7、	Handers文件夹下面是业务逻辑类
8、	ViewControllers下面存放的是UI层面的视图
9、 ViewModel处理view和model之间的业务逻辑
10、	Resources存放的是资源
二、架构层次说明
整个程序分3层，UI层、业务逻辑层、请求层。UI层负责页面的展示，业务逻辑层负责数据的处理，请求层负责数据的请求和解析。所有的数据交互都在业务逻辑层处理（包括数据的存储和读取）。这样分工明确，结构层次清晰。交互也很清晰，请求接口的改动，不会牵连到UI层。同时也更好地进行协作开发。

三、回调机制
请求回调采用的是映射的方式回调。业务逻辑层对UI的回到采用通知的方式（注：为什么不考虑用映射回调。如果使用映射回调，我离开页面不想接收  回到，用映射的方式不好处理）。第三方库大部分采用cocoapods管理。

四、代码规范
代码规范参考OC的编码规范书写。下面提一些代码结构的规范。
1、	UI代码结构规范。先是声明周期方法，然后是UI视图创建方法、数据源赋值初始化，然后是加载数据方法，回调方法，再是自写方法，再然后是delegate等代理方法。每一段用分割线分开，便于代码的查找
2、	文件命名规范。图片等文件，命名都添加前缀，标明所属哪个模块的，避免文件重名，编译加载图片错乱。
3、	工程里面需要有自己的BASE类，独立模块可以有自己的独立的基类。基类可以更好地进行公共方法的抽离，也可以添加全局的属性。列表页面需要添加自己的基类，我们可以在基类里面添加tableView，添加上来、下来刷新等等。
4、	每个工程目录下面放个readmine文件，简单介绍下整个工程的目录结构，注意事项等等。

计划安排
1、	所有的文件路径建立相应的物理目录，文件存放按照规范存放。没用的代码和类应删除。
2、	规范请求通知回调，如果只是在当前页面需要处理的通知统一放在viewWillAppear里面，页面离开的时候viewWillDisappear里面移除相对应的通知
3、	整理工具类、扩展类、常量、宏定义文件。该放哪个类里面就放哪个类里面。
4、	弹出提示规范，添加自消失提示，自消失提示使用单例，避免重复提示。
5、	业务逻辑接口添加缓存机制。接口添加一个是否取缓存的参数，如果需要取缓存就取缓存先返回UI，如果是先取缓存的，同时也要添加一个参数是否需要发起网络请求，有时候我们只是需要缓存的数据。
6、	缓存机制。一般采用plist文件存储，有些小数据采用NSUserDefault沙盒存储。如果牵涉到一些大数据，采用数据库存储（sqlite或者coreData）
7、	UI代码的整理，按照上面的规范来整理代码


几点原则
1，定义基类：BaseView，BaseViewController，BaseTableviewCell等，所有的view和viewcontroller均继承自己的基类。
2，ViewController不直接调用网络服务，通过业务逻辑层中转；
3，ViewController和业务逻辑层以及和ViewController之间传值用Model，不要用自定义字典等结构
4，ViewController不做业务处理和计算。
5，ViewController和视图分离，其他视图元素提取到Views文件夹
6，数据访问层、业务逻辑层、模型层可以剥离和插拔,可以独立单元测试，不依赖view和viewcontroller

文件命名
Controller：xxxVC，
Model：xxxModel，
View：xxxView，
NSString:xxxStr　　 
NSMutableString:xxxMStr
UIImage:xxxImg　
UIImageView:xxxImgView　　　
UILabel:xxxLabel
UIButton:xxxBtn
UINavigationBar:xxxNBar
UIToolBar:xxxTBar　
UISearchBar:xxxSBar
UITextField:xxxTField　
UITextView:xxxTView
NSArray:xxxArray　　
NSMutableArray:xxxMArray
NSDictionary:xxxDict
NSMutableDictionary:xxxMDict
NSSet:xxxSet　　
NSMutableSet:xxxMSet

代码规范细节
说明：为了不影响阅读，一个类的代码行数尽量不要超过300行;一个方法尽量不要超过30行。有超过的在重构的时候想办法分解。
 
1.每个.h文件最开始处用简短文字说明一下该类的功能逻辑。
2.引入其它类时，若要作为实例变量的在.h中引入。否则在.m中引入。
3.@interface与@implementation与#import 之间空一行。
4.a:声明实例变量一律以属性声明。
   b:其它类要访问的实例变量和方法在.h文件中声明，否则声明于.m文件中。
　c:实例变量及方法以功能块放在一起，实现一个功能的连续着放在一起，另一个功能的空一行开始声明。
　d:实例变量紧接@interface后开始，方法在实例变量后空一行开始。
　e:每个功能块可作简单说明，单个实例变量方法可不作说明，关键的或特殊的变量或方法单独作说明。注释放于变量声明上一行。
5.类中第个功能模块以 #pragma mark -  分隔，上空两行，下空一行。
6.NSLog在项目中一律禁用，改用BBLog 或者 BBDetailLog（显示文件，路径 方法名 行号）。

7.程序中变量、方法命名尽量能以字面意思表示功能，对于需要用注释来解释的部分代码，注释以如下格式表述：（可以用文档注释插件快速实现）
/**
 * 方法或变量说明
 * @param 参数1说明(针对方法)
 * @param 参数2说明(针对方法)
 * @return 若方法有返回值则对返回值作说明
 */

Xcode配置
1.全部统一用ARC。
2.用Git管理代码。
3.在项目.pch文件加入一段去除release的NSLog代码:
#ifdef DEBUG
#define BBLog(...) NSLog(__VA_ARGS__)
#else
#define BBLog(...)
#endif


































