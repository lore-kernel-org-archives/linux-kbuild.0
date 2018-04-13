Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:39469 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750867AbeDMPNK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Apr 2018 11:13:10 -0400
Date: Fri, 13 Apr 2018 23:12:14 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:kconfig-shell-v3 21/30] arch/Kconfig:542: syntax error
Message-ID: <201804132304.4gWZTHtV%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig-shell-v3
head:   cab76bbc77d9c585f35b5b9289850a3ae64bb879
commit: 403c3fc6b2e7499e92eafe0ab82b18172cd495f6 [21/30] stack-protector: test compiler capability in Kconfig and drop AUTO mode
config: um-x86_64_defconfig
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        git checkout 403c3fc6b2e7499e92eafe0ab82b18172cd495f6
        make ARCH=um SUBARCH=x86_64 defconfig
        make ARCH=um SUBARCH=x86_64

All errors (new ones prefixed by >>):

>> arch/Kconfig:542: syntax error
>> arch/Kconfig:541: invalid option
   arch/Kconfig:547: syntax error
   arch/Kconfig:546: invalid option
   arch/Kconfig:571: syntax error
   arch/Kconfig:570: invalid option
   make[2]: *** [defconfig] Error 1
   make[1]: *** [defconfig] Error 2
   make: *** [sub-make] Error 2
--
>> arch/Kconfig:542: syntax error
>> arch/Kconfig:541: invalid option
   arch/Kconfig:547: syntax error
   arch/Kconfig:546: invalid option
   arch/Kconfig:571: syntax error
   arch/Kconfig:570: invalid option
   make[2]: *** [oldconfig] Error 1
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
>> arch/Kconfig:542: syntax error
>> arch/Kconfig:541: invalid option
   arch/Kconfig:547: syntax error
   arch/Kconfig:546: invalid option
   arch/Kconfig:571: syntax error
   arch/Kconfig:570: invalid option
   make[2]: *** [olddefconfig] Error 1
   make[2]: Target 'oldnoconfig' not remade because of errors.
   make[1]: *** [oldnoconfig] Error 2
   make: *** [sub-make] Error 2

vim +542 arch/Kconfig

     5	
     6	config CRASH_CORE
     7		bool
     8	
     9	config KEXEC_CORE
    10		select CRASH_CORE
    11		bool
    12	
    13	config HAVE_IMA_KEXEC
    14		bool
    15	
    16	config OPROFILE
    17		tristate "OProfile system profiling"
    18		depends on PROFILING
    19		depends on HAVE_OPROFILE
    20		select RING_BUFFER
    21		select RING_BUFFER_ALLOW_SWAP
    22		help
    23		  OProfile is a profiling system capable of profiling the
    24		  whole system, include the kernel, kernel modules, libraries,
    25		  and applications.
    26	
    27		  If unsure, say N.
    28	
    29	config OPROFILE_EVENT_MULTIPLEX
    30		bool "OProfile multiplexing support (EXPERIMENTAL)"
    31		default n
    32		depends on OPROFILE && X86
    33		help
    34		  The number of hardware counters is limited. The multiplexing
    35		  feature enables OProfile to gather more events than counters
    36		  are provided by the hardware. This is realized by switching
    37		  between events at a user specified time interval.
    38	
    39		  If unsure, say N.
    40	
    41	config HAVE_OPROFILE
    42		bool
    43	
    44	config OPROFILE_NMI_TIMER
    45		def_bool y
    46		depends on PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !PPC64
    47	
    48	config KPROBES
    49		bool "Kprobes"
    50		depends on MODULES
    51		depends on HAVE_KPROBES
    52		select KALLSYMS
    53		help
    54		  Kprobes allows you to trap at almost any kernel address and
    55		  execute a callback function.  register_kprobe() establishes
    56		  a probepoint and specifies the callback.  Kprobes is useful
    57		  for kernel debugging, non-intrusive instrumentation and testing.
    58		  If in doubt, say "N".
    59	
    60	config JUMP_LABEL
    61	       bool "Optimize very unlikely/likely branches"
    62	       depends on HAVE_ARCH_JUMP_LABEL
    63	       help
    64	         This option enables a transparent branch optimization that
    65		 makes certain almost-always-true or almost-always-false branch
    66		 conditions even cheaper to execute within the kernel.
    67	
    68		 Certain performance-sensitive kernel code, such as trace points,
    69		 scheduler functionality, networking code and KVM have such
    70		 branches and include support for this optimization technique.
    71	
    72	         If it is detected that the compiler has support for "asm goto",
    73		 the kernel will compile such branches with just a nop
    74		 instruction. When the condition flag is toggled to true, the
    75		 nop will be converted to a jump instruction to execute the
    76		 conditional block of instructions.
    77	
    78		 This technique lowers overhead and stress on the branch prediction
    79		 of the processor and generally makes the kernel faster. The update
    80		 of the condition is slower, but those are always very rare.
    81	
    82		 ( On 32-bit x86, the necessary options added to the compiler
    83		   flags may increase the size of the kernel slightly. )
    84	
    85	config STATIC_KEYS_SELFTEST
    86		bool "Static key selftest"
    87		depends on JUMP_LABEL
    88		help
    89		  Boot time self-test of the branch patching code.
    90	
    91	config OPTPROBES
    92		def_bool y
    93		depends on KPROBES && HAVE_OPTPROBES
    94		select TASKS_RCU if PREEMPT
    95	
    96	config KPROBES_ON_FTRACE
    97		def_bool y
    98		depends on KPROBES && HAVE_KPROBES_ON_FTRACE
    99		depends on DYNAMIC_FTRACE_WITH_REGS
   100		help
   101		 If function tracer is enabled and the arch supports full
   102		 passing of pt_regs to function tracing, then kprobes can
   103		 optimize on top of function tracing.
   104	
   105	config UPROBES
   106		def_bool n
   107		depends on ARCH_SUPPORTS_UPROBES
   108		help
   109		  Uprobes is the user-space counterpart to kprobes: they
   110		  enable instrumentation applications (such as 'perf probe')
   111		  to establish unintrusive probes in user-space binaries and
   112		  libraries, by executing handler functions when the probes
   113		  are hit by user-space applications.
   114	
   115		  ( These probes come in the form of single-byte breakpoints,
   116		    managed by the kernel and kept transparent to the probed
   117		    application. )
   118	
   119	config HAVE_64BIT_ALIGNED_ACCESS
   120		def_bool 64BIT && !HAVE_EFFICIENT_UNALIGNED_ACCESS
   121		help
   122		  Some architectures require 64 bit accesses to be 64 bit
   123		  aligned, which also requires structs containing 64 bit values
   124		  to be 64 bit aligned too. This includes some 32 bit
   125		  architectures which can do 64 bit accesses, as well as 64 bit
   126		  architectures without unaligned access.
   127	
   128		  This symbol should be selected by an architecture if 64 bit
   129		  accesses are required to be 64 bit aligned in this way even
   130		  though it is not a 64 bit architecture.
   131	
   132		  See Documentation/unaligned-memory-access.txt for more
   133		  information on the topic of unaligned memory accesses.
   134	
   135	config HAVE_EFFICIENT_UNALIGNED_ACCESS
   136		bool
   137		help
   138		  Some architectures are unable to perform unaligned accesses
   139		  without the use of get_unaligned/put_unaligned. Others are
   140		  unable to perform such accesses efficiently (e.g. trap on
   141		  unaligned access and require fixing it up in the exception
   142		  handler.)
   143	
   144		  This symbol should be selected by an architecture if it can
   145		  perform unaligned accesses efficiently to allow different
   146		  code paths to be selected for these cases. Some network
   147		  drivers, for example, could opt to not fix up alignment
   148		  problems with received packets if doing so would not help
   149		  much.
   150	
   151		  See Documentation/unaligned-memory-access.txt for more
   152		  information on the topic of unaligned memory accesses.
   153	
   154	config ARCH_USE_BUILTIN_BSWAP
   155	       bool
   156	       help
   157		 Modern versions of GCC (since 4.4) have builtin functions
   158		 for handling byte-swapping. Using these, instead of the old
   159		 inline assembler that the architecture code provides in the
   160		 __arch_bswapXX() macros, allows the compiler to see what's
   161		 happening and offers more opportunity for optimisation. In
   162		 particular, the compiler will be able to combine the byteswap
   163		 with a nearby load or store and use load-and-swap or
   164		 store-and-swap instructions if the architecture has them. It
   165		 should almost *never* result in code which is worse than the
   166		 hand-coded assembler in <asm/swab.h>.  But just in case it
   167		 does, the use of the builtins is optional.
   168	
   169		 Any architecture with load-and-swap or store-and-swap
   170		 instructions should set this. And it shouldn't hurt to set it
   171		 on architectures that don't have such instructions.
   172	
   173	config KRETPROBES
   174		def_bool y
   175		depends on KPROBES && HAVE_KRETPROBES
   176	
   177	config USER_RETURN_NOTIFIER
   178		bool
   179		depends on HAVE_USER_RETURN_NOTIFIER
   180		help
   181		  Provide a kernel-internal notification when a cpu is about to
   182		  switch to user mode.
   183	
   184	config HAVE_IOREMAP_PROT
   185		bool
   186	
   187	config HAVE_KPROBES
   188		bool
   189	
   190	config HAVE_KRETPROBES
   191		bool
   192	
   193	config HAVE_OPTPROBES
   194		bool
   195	
   196	config HAVE_KPROBES_ON_FTRACE
   197		bool
   198	
   199	config HAVE_FUNCTION_ERROR_INJECTION
   200		bool
   201	
   202	config HAVE_NMI
   203		bool
   204	
   205	#
   206	# An arch should select this if it provides all these things:
   207	#
   208	#	task_pt_regs()		in asm/processor.h or asm/ptrace.h
   209	#	arch_has_single_step()	if there is hardware single-step support
   210	#	arch_has_block_step()	if there is hardware block-step support
   211	#	asm/syscall.h		supplying asm-generic/syscall.h interface
   212	#	linux/regset.h		user_regset interfaces
   213	#	CORE_DUMP_USE_REGSET	#define'd in linux/elf.h
   214	#	TIF_SYSCALL_TRACE	calls tracehook_report_syscall_{entry,exit}
   215	#	TIF_NOTIFY_RESUME	calls tracehook_notify_resume()
   216	#	signal delivery		calls tracehook_signal_handler()
   217	#
   218	config HAVE_ARCH_TRACEHOOK
   219		bool
   220	
   221	config HAVE_DMA_CONTIGUOUS
   222		bool
   223	
   224	config GENERIC_SMP_IDLE_THREAD
   225	       bool
   226	
   227	config GENERIC_IDLE_POLL_SETUP
   228	       bool
   229	
   230	config ARCH_HAS_FORTIFY_SOURCE
   231		bool
   232		help
   233		  An architecture should select this when it can successfully
   234		  build and run with CONFIG_FORTIFY_SOURCE.
   235	
   236	# Select if arch has all set_memory_ro/rw/x/nx() functions in asm/cacheflush.h
   237	config ARCH_HAS_SET_MEMORY
   238		bool
   239	
   240	# Select if arch init_task must go in the __init_task_data section
   241	config ARCH_TASK_STRUCT_ON_STACK
   242	       bool
   243	
   244	# Select if arch has its private alloc_task_struct() function
   245	config ARCH_TASK_STRUCT_ALLOCATOR
   246		bool
   247	
   248	config HAVE_ARCH_THREAD_STRUCT_WHITELIST
   249		bool
   250		depends on !ARCH_TASK_STRUCT_ALLOCATOR
   251		help
   252		  An architecture should select this to provide hardened usercopy
   253		  knowledge about what region of the thread_struct should be
   254		  whitelisted for copying to userspace. Normally this is only the
   255		  FPU registers. Specifically, arch_thread_struct_whitelist()
   256		  should be implemented. Without this, the entire thread_struct
   257		  field in task_struct will be left whitelisted.
   258	
   259	# Select if arch has its private alloc_thread_stack() function
   260	config ARCH_THREAD_STACK_ALLOCATOR
   261		bool
   262	
   263	# Select if arch wants to size task_struct dynamically via arch_task_struct_size:
   264	config ARCH_WANTS_DYNAMIC_TASK_STRUCT
   265		bool
   266	
   267	config HAVE_REGS_AND_STACK_ACCESS_API
   268		bool
   269		help
   270		  This symbol should be selected by an architecure if it supports
   271		  the API needed to access registers and stack entries from pt_regs,
   272		  declared in asm/ptrace.h
   273		  For example the kprobes-based event tracer needs this API.
   274	
   275	config HAVE_CLK
   276		bool
   277		help
   278		  The <linux/clk.h> calls support software clock gating and
   279		  thus are a key power management tool on many systems.
   280	
   281	config HAVE_DMA_API_DEBUG
   282		bool
   283	
   284	config HAVE_HW_BREAKPOINT
   285		bool
   286		depends on PERF_EVENTS
   287	
   288	config HAVE_MIXED_BREAKPOINTS_REGS
   289		bool
   290		depends on HAVE_HW_BREAKPOINT
   291		help
   292		  Depending on the arch implementation of hardware breakpoints,
   293		  some of them have separate registers for data and instruction
   294		  breakpoints addresses, others have mixed registers to store
   295		  them but define the access type in a control register.
   296		  Select this option if your arch implements breakpoints under the
   297		  latter fashion.
   298	
   299	config HAVE_USER_RETURN_NOTIFIER
   300		bool
   301	
   302	config HAVE_PERF_EVENTS_NMI
   303		bool
   304		help
   305		  System hardware can generate an NMI using the perf event
   306		  subsystem.  Also has support for calculating CPU cycle events
   307		  to determine how many clock cycles in a given period.
   308	
   309	config HAVE_HARDLOCKUP_DETECTOR_PERF
   310		bool
   311		depends on HAVE_PERF_EVENTS_NMI
   312		help
   313		  The arch chooses to use the generic perf-NMI-based hardlockup
   314		  detector. Must define HAVE_PERF_EVENTS_NMI.
   315	
   316	config HAVE_NMI_WATCHDOG
   317		depends on HAVE_NMI
   318		bool
   319		help
   320		  The arch provides a low level NMI watchdog. It provides
   321		  asm/nmi.h, and defines its own arch_touch_nmi_watchdog().
   322	
   323	config HAVE_HARDLOCKUP_DETECTOR_ARCH
   324		bool
   325		select HAVE_NMI_WATCHDOG
   326		help
   327		  The arch chooses to provide its own hardlockup detector, which is
   328		  a superset of the HAVE_NMI_WATCHDOG. It also conforms to config
   329		  interfaces and parameters provided by hardlockup detector subsystem.
   330	
   331	config HAVE_PERF_REGS
   332		bool
   333		help
   334		  Support selective register dumps for perf events. This includes
   335		  bit-mapping of each registers and a unique architecture id.
   336	
   337	config HAVE_PERF_USER_STACK_DUMP
   338		bool
   339		help
   340		  Support user stack dumps for perf event samples. This needs
   341		  access to the user stack pointer which is not unified across
   342		  architectures.
   343	
   344	config HAVE_ARCH_JUMP_LABEL
   345		bool
   346	
   347	config HAVE_RCU_TABLE_FREE
   348		bool
   349	
   350	config ARCH_HAVE_NMI_SAFE_CMPXCHG
   351		bool
   352	
   353	config HAVE_ALIGNED_STRUCT_PAGE
   354		bool
   355		help
   356		  This makes sure that struct pages are double word aligned and that
   357		  e.g. the SLUB allocator can perform double word atomic operations
   358		  on a struct page for better performance. However selecting this
   359		  might increase the size of a struct page by a word.
   360	
   361	config HAVE_CMPXCHG_LOCAL
   362		bool
   363	
   364	config HAVE_CMPXCHG_DOUBLE
   365		bool
   366	
   367	config ARCH_WEAK_RELEASE_ACQUIRE
   368		bool
   369	
   370	config ARCH_WANT_IPC_PARSE_VERSION
   371		bool
   372	
   373	config ARCH_WANT_COMPAT_IPC_PARSE_VERSION
   374		bool
   375	
   376	config ARCH_WANT_OLD_COMPAT_IPC
   377		select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
   378		bool
   379	
   380	config HAVE_ARCH_SECCOMP_FILTER
   381		bool
   382		help
   383		  An arch should select this symbol if it provides all of these things:
   384		  - syscall_get_arch()
   385		  - syscall_get_arguments()
   386		  - syscall_rollback()
   387		  - syscall_set_return_value()
   388		  - SIGSYS siginfo_t support
   389		  - secure_computing is called from a ptrace_event()-safe context
   390		  - secure_computing return value is checked and a return value of -1
   391		    results in the system call being skipped immediately.
   392		  - seccomp syscall wired up
   393	
   394	config SECCOMP_FILTER
   395		def_bool y
   396		depends on HAVE_ARCH_SECCOMP_FILTER && SECCOMP && NET
   397		help
   398		  Enable tasks to build secure computing environments defined
   399		  in terms of Berkeley Packet Filter programs which implement
   400		  task-defined system call filtering polices.
   401	
   402		  See Documentation/prctl/seccomp_filter.txt for details.
   403	
   404	config HAVE_GCC_PLUGINS
   405		bool
   406		help
   407		  An arch should select this symbol if it supports building with
   408		  GCC plugins.
   409	
   410	menuconfig GCC_PLUGINS
   411		bool "GCC plugins"
   412		depends on HAVE_GCC_PLUGINS
   413		depends on !COMPILE_TEST
   414		help
   415		  GCC plugins are loadable modules that provide extra features to the
   416		  compiler. They are useful for runtime instrumentation and static analysis.
   417	
   418		  See Documentation/gcc-plugins.txt for details.
   419	
   420	config GCC_PLUGIN_CYC_COMPLEXITY
   421		bool "Compute the cyclomatic complexity of a function" if EXPERT
   422		depends on GCC_PLUGINS
   423		depends on !COMPILE_TEST
   424		help
   425		  The complexity M of a function's control flow graph is defined as:
   426		   M = E - N + 2P
   427		  where
   428	
   429		  E = the number of edges
   430		  N = the number of nodes
   431		  P = the number of connected components (exit nodes).
   432	
   433		  Enabling this plugin reports the complexity to stderr during the
   434		  build. It mainly serves as a simple example of how to create a
   435		  gcc plugin for the kernel.
   436	
   437	config GCC_PLUGIN_SANCOV
   438		bool
   439		depends on GCC_PLUGINS
   440		help
   441		  This plugin inserts a __sanitizer_cov_trace_pc() call at the start of
   442		  basic blocks. It supports all gcc versions with plugin support (from
   443		  gcc-4.5 on). It is based on the commit "Add fuzzing coverage support"
   444		  by Dmitry Vyukov <dvyukov@google.com>.
   445	
   446	config GCC_PLUGIN_LATENT_ENTROPY
   447		bool "Generate some entropy during boot and runtime"
   448		depends on GCC_PLUGINS
   449		help
   450		  By saying Y here the kernel will instrument some kernel code to
   451		  extract some entropy from both original and artificially created
   452		  program state.  This will help especially embedded systems where
   453		  there is little 'natural' source of entropy normally.  The cost
   454		  is some slowdown of the boot process (about 0.5%) and fork and
   455		  irq processing.
   456	
   457		  Note that entropy extracted this way is not cryptographically
   458		  secure!
   459	
   460		  This plugin was ported from grsecurity/PaX. More information at:
   461		   * https://grsecurity.net/
   462		   * https://pax.grsecurity.net/
   463	
   464	config GCC_PLUGIN_STRUCTLEAK
   465		bool "Force initialization of variables containing userspace addresses"
   466		depends on GCC_PLUGINS
   467		help
   468		  This plugin zero-initializes any structures containing a
   469		  __user attribute. This can prevent some classes of information
   470		  exposures.
   471	
   472		  This plugin was ported from grsecurity/PaX. More information at:
   473		   * https://grsecurity.net/
   474		   * https://pax.grsecurity.net/
   475	
   476	config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
   477		bool "Force initialize all struct type variables passed by reference"
   478		depends on GCC_PLUGIN_STRUCTLEAK
   479		help
   480		  Zero initialize any struct type local variable that may be passed by
   481		  reference without having been initialized.
   482	
   483	config GCC_PLUGIN_STRUCTLEAK_VERBOSE
   484		bool "Report forcefully initialized variables"
   485		depends on GCC_PLUGIN_STRUCTLEAK
   486		depends on !COMPILE_TEST
   487		help
   488		  This option will cause a warning to be printed each time the
   489		  structleak plugin finds a variable it thinks needs to be
   490		  initialized. Since not all existing initializers are detected
   491		  by the plugin, this can produce false positive warnings.
   492	
   493	config GCC_PLUGIN_RANDSTRUCT
   494		bool "Randomize layout of sensitive kernel structures"
   495		depends on GCC_PLUGINS
   496		select MODVERSIONS if MODULES
   497		help
   498		  If you say Y here, the layouts of structures that are entirely
   499		  function pointers (and have not been manually annotated with
   500		  __no_randomize_layout), or structures that have been explicitly
   501		  marked with __randomize_layout, will be randomized at compile-time.
   502		  This can introduce the requirement of an additional information
   503		  exposure vulnerability for exploits targeting these structure
   504		  types.
   505	
   506		  Enabling this feature will introduce some performance impact,
   507		  slightly increase memory usage, and prevent the use of forensic
   508		  tools like Volatility against the system (unless the kernel
   509		  source tree isn't cleaned after kernel installation).
   510	
   511		  The seed used for compilation is located at
   512		  scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
   513		  a make clean to allow for external modules to be compiled with
   514		  the existing seed and will be removed by a make mrproper or
   515		  make distclean.
   516	
   517		  Note that the implementation requires gcc 4.7 or newer.
   518	
   519		  This plugin was ported from grsecurity/PaX. More information at:
   520		   * https://grsecurity.net/
   521		   * https://pax.grsecurity.net/
   522	
   523	config GCC_PLUGIN_RANDSTRUCT_PERFORMANCE
   524		bool "Use cacheline-aware structure randomization"
   525		depends on GCC_PLUGIN_RANDSTRUCT
   526		depends on !COMPILE_TEST
   527		help
   528		  If you say Y here, the RANDSTRUCT randomization will make a
   529		  best effort at restricting randomization to cacheline-sized
   530		  groups of elements.  It will further not randomize bitfields
   531		  in structures.  This reduces the performance hit of RANDSTRUCT
   532		  at the cost of weakened randomization.
   533	
   534	config HAVE_CC_STACKPROTECTOR
   535		bool
   536		help
   537		  An arch should select this symbol if:
   538		  - it has implemented a stack canary (e.g. __stack_chk_guard)
   539	
   540	config CC_HAS_STACKPROTECTOR_NONE
 > 541		def_bool $(cc-option -fno-stack-protector)
 > 542	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
