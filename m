Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572372;
	b=P3ri/k/60+4dYNhwypkTXRUamLF/NnjXP0tSSgQxBUbZznnpBnRP9jhK8DrVgDqeViJE
	 QXCNUXFwI+3q4MSeCO+zj/dczI+HqvHyt4l2IstI5kiBn1mC0zmKGh806k5Bam9EDobl1
	 5lv611fhSULwQIDioEXcKEwrwmP/ADecKezctHP+ybLEtqS/Mb7zTbPHX/mUJtGjzv2AP
	 DFvIsz6yzxZk3PcQodGDG+DaPW0EYKtIfiSvg6Emp9r5iJDbpLki1IvRjXnMojJPWX/Xx
	 BC8APo4J8H34pM32p6f+X767E84nDP2C/eHiyzywoVZTL0Cibx2iGmkiFE4BpeN4ROg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572372;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E+h3Hu3oJyey0M+F6Lnx13MjUSrk3Qy1Z4+AJGafCNo=;
	b=UACVVLMxauRZ7DyN0POfBwZt4Rde/IQ9uHChcpUIKFTC2rJNyQVH00xMAEJm40ywMMjb
	 3JtZ+XBdsYPGqht1TgpTLEbxY+2/qjg26oTDdrvUN9hczA2AaHmvPIZCDpNOamM6tHBp7
	 o805smkENfP9qyjj5Gu/WscWVXsMcemOE5vs39el9XZ1JqLkNWevLlFyCJKMImqsNad4S
	 4HhzuXAKKpsSsN+kWF9u/WDrdgBh6ZnQzvlPd2MRLD1wchUbeInXwmFxd7cYdFv3LJ4On
	 41bGLB4fXbAk2x957z0Jod0KxzC0nE/jsknO8GgcJxC1O+MOHpEpT6oUggFwpxQ1R9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Th+Kiq2e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E19606A31E;
	Wed, 25 Nov 2026 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Th+Kiq2e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50ACD1F000C6;
	Wed, 25 Nov 2026 02:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572371;
	bh=E+h3Hu3oJyey0M+F6Lnx13MjUSrk3Qy1Z4+AJGafCNo=;
	h=From:To:Cc:Subject:Date;
	b=Th+Kiq2evMZsw7cTsdaBUZDsO96gMKgtO3lRAsRepi8bu6EmZTjlRnMkO66Ba5jCm
	 m4XEpBHqcHN0U8AjHOPf7xJIIMHUpwHI4ZN+6Z0l+frgWEiBH2viE5R9mP0/y/+/h3
	 ZCwHlGds4jCvmP9b1dIJspDYZzVUy72NosquOtEFNOHEquNaOP31M9iri+klKzy0Uo
	 i0BSb5/ILswSMZ7ppe5pDuxdl+Vmb73oKU2lhDQq1tzGzZTYvmkduUa0BSKQF4JV/7
	 2IOZdtzfzdQnU+hafibPa3sZH7/NbvVoYn6Cgd1HM5SqLB+/NWuMRW9vZWxlm+U71W
	 UG0fUL03YJtIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Potapenko <glider@google.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Frantisek Hrbata <fhrbata@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	kasan-dev@googlegroups.com,
	Konstantin Khorenko <khorenko@virtuozzo.com>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v3 00/19] Unify code coverage and add Clang source-based coverage with MC/DC
Date: Tue, 24 Nov 2026 21:05:44 -0500
Message-ID: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous postings of Clang's source-based code coverage [1][2] drew
objections [3][4]: rather than a third coverage implementation with its
own interface next to gcov and KCOV, reviewers asked for a unified
coverage interface, and for coverage instrumentation to honour noinstr.
This series first restructures the existing coverage support into one
framework, then adds source-based coverage and MC/DC as part of it.

Architecture
============

Today, each coverage implementation brings its own plumbing. gcov has its
compiler flags in scripts/Makefile.gcov, the GCOV_PROFILE annotations,
its options under "General architecture-dependent options" and
/sys/kernel/debug/gcov/. KCOV has scripts/Makefile.kcov, KCOV_INSTRUMENT,
its options under "Kernel hacking" and /sys/kernel/debug/kcov. Anything
that depends on the kernel being built with coverage instrumentation
spells it GCOV_KERNEL, and the earlier source-based coverage postings
added a third copy of all of it.

This series turns that into one framework, kernel/coverage/:

  kernel/coverage/
    core.c, coverage.h   debugfs root, backend registration
    gcov/                gcov backend (moved from kernel/gcov/)
    llvm/                Clang source-based coverage backend (new)
    kcov.c               KCOV (moved from kernel/kcov.c)

A code coverage measurement implementation, or backend, only provides
what is specific to its toolchain:

- its compiler flags, as CFLAGS_COVERAGE in scripts/Makefile.<backend>,
  including the ones for MC/DC;
- a struct coverage_backend registered with the core: its name and its
  enabled features;
- its data and a reset file, in a directory of its name under
  /sys/kernel/debug/coverage/;
- its capabilities: the architectures it supports, and whether it can
  instrument modules.

Everything else is shared by all backends:

- Configuration: one "Code coverage" menu with a choice of backend (none,
  gcov or Clang source-based coverage, as each data format is defined by
  its toolchain), CONFIG_COVERAGE_KERNEL for anything that depends on
  coverage instrumentation (LTO, KCFI, ...), CONFIG_COVERAGE_PROFILE_ALL,
  the per-subsystem CONFIG_COVERAGE_PROFILE_<subsystem> options and
  CONFIG_COVERAGE_MCDC. Existing configurations are migrated.
- Build control: COVERAGE_PROFILE[_obj.o] decides what gets instrumented,
  whichever backend is selected. Kbuild applies the backend's flags,
  leaves modules alone for backends that can't export their data, and
  sets up objtool accordingly.
- Runtime interface: /sys/kernel/debug/coverage/, with "backend" naming
  the backend and its features, which is also the name of the directory
  with the backend's data and its reset file. The existing gcov and kcov
  entries stay where they are, for lcov and syzkaller, and are linked
  from there.
- noinstr: one mechanism for all backends, see below.

With that in place, adding source-based coverage (patch 13) only takes
the backend specific parts.

KCOV is a per-task tracing interface for fuzzers with its own UAPI, so it
is not a backend: it moves into kernel/coverage/, the same menu, the same
debugfs root and the same documentation, but it keeps its UAPI and
KCOV_INSTRUMENT, whose exclusions serve the fuzzing signal and the KCOV
runtime rather than marking code that can't be instrumented.

One thing changes for lcov. Patch 1 moves gcov's own base.c, and lcov
detects the kernel build directory through kernel/gcov/base.gcno in the
gcov debugfs tree of a fully profiled kernel. It no longer finds that
file, and "lcov --capture" then needs the build directory passed with
-b. That is from reading lcov's get_base(), I haven't run lcov on it.
Peter, would you rather teach lcov the new path, or have that file stay
where lcov expects it?

noinstr
=======

gcov and source-based coverage update their counters inline, and the
compilers add those updates before inlining. noinstr functions are not
instrumented themselves, but whatever gets inlined into them brings its
counter updates along: an x86-64 defconfig kernel with KVM, built with
GCC 16 and gcov for the whole kernel, has 1823 of them in 108 noinstr
functions. objtool didn't notice, as these are plain memory updates
rather than calls. KCOV instruments after inlining and was not affected.

v2 dealt with this by not instrumenting __always_inline functions at
all. This version follows Josh's suggestion instead and has objtool take
the instrumentation out of noinstr code:

- Patches 4-9 make the empty stubs that noinstr code calls
  __always_inline, and switch the GHCB accessors to the arch_ bitops.
- Patch 10 makes objtool replace the counter updates in noinstr code by
  NOPs, as part of --hacks=noinstr, which already does that for KCOV
  calls. This is all GCC needs. Its changelog has the background on why
  a counter update in noinstr code is a problem.
- Patch 11 points the accesses that can't simply be removed, which only
  Clang generates, at a sink that objtool adds to the object. With
  source-based coverage and MC/DC that is 229 accesses, next to 3319
  counter updates that are replaced by NOPs. One thing is left alone:
  a gcov counter that Clang updates through a register holding its
  address, as such an address can't be told from the end of the object
  in front of the counter.
- Patch 12 drops the coverage exclusion that only existed for noinstr:
  arch/x86/coco/sev/noinstr.o, added by commit 9efb74f84ba8 ("x86/sev:
  Disable GCOV on noinstr object").

Compared to v2, __always_inline functions are instrumented again, and
two problems that their exclusion caused, which I found after posting
v2, are gone: a build failure of drivers/iommu/generic_pt/fmt/iommu_amdv1.o
with GCC's MC/DC, and objtool uaccess warnings in a tinyconfig build
with gcov. What is lost instead is that a function which gets inlined
into noinstr code doesn't count the executions that come through it.

This is an x86-64 fix: objtool is what removes the instrumentation, and
only x86-64 has HAVE_NOINSTR_HACK. The other architectures are where
they are without this series, which is a step back from v2 for them:
whatever gets inlined into their noinstr code keeps its gcov counters,
and nothing checks. An arm64 defconfig kernel built with GCC and gcov
has 101 references to counters in its noinstr code without this series
and 90 with it. Peter, are you fine with that? The objtool port for
arm64 [7] should make the same possible there.

With Clang, the sink that patch 11 adds is still ordinary memory that
noinstr code writes to, and nothing keeps a data breakpoint away from
it yet.

Source-based coverage and MC/DC
===============================

Patches 13-19 add Clang's source-based code coverage for code built into
the kernel image (raw profile formats of Clang 19-22 and 23+), enable it
on x86_64, add MC/DC measurement for it and for gcov with GCC 14+ [5],
including the gcov merge fix MC/DC needs, and document the result.

Merging
=======

The series touches kbuild, x86, objtool, gcov and KCOV. gcov and KCOV
changes usually go through Andrew's tree, so I'd suggest taking it there,
with acks from the x86, objtool and kbuild maintainers.

It conflicts with "scripts/Kconfig.toolchain: Remove
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR" in the kbuild tree (commit
4e163e2feb5b in next-20261124), which removes a line from
kernel/gcov/Kconfig that patches 1 and 2 move and then drop. The
resolution is to take this series' side of that file.

Testing
=======

On v7.4-rc4:

- x86_64 tinyconfig, every patch builds without compiler or objtool
  warnings: with GCC 16 (gcov for the whole kernel, KCOV and
  CONFIG_DEBUG_ENTRY; MC/DC from patch 18 on) and, from patch 13 on,
  with Clang 22 (source-based coverage from patch 14 on, MC/DC from
  patch 15 on, and KCOV).
- x86_64 defconfig with KVM and CONFIG_DEBUG_ENTRY, the whole kernel
  instrumented, with CONFIG_X86_KERNEL_IBT (objtool runs on vmlinux.o)
  and without it (objtool runs on every object, here also with lockdep
  and CONFIG_RSEQ=n):
  - gcov with MC/DC, GCC 16: no warnings, and no coverage counter is
    referenced from noinstr code in vmlinux or the KVM modules. objtool
    replaces 3572 counter updates in vmlinux and 142 in the modules.
  - source-based coverage with MC/DC, Clang 22: the same, with 229
    accesses going to the sink.
  - gcov, Clang 22, with IBT only: no coverage counter is referenced
    from noinstr code (2117 references without this series), including
    the kind that patch 11 has to leave alone. objtool warns about
    calls to rseq_trace_ip_fixup() with UACCESS enabled in four places;
    without this series it has 22 warnings, three of them these.
- Clang 21 with source-based coverage and MC/DC builds, with the MC/DC
  warnings that it can't turn off.
- Booted in a VM, gcov (GCC) and source-based coverage (Clang), both
  with MC/DC: coverage data, reset, MC/DC reports from gcov --conditions
  and llvm-cov, and the gcov data of the kvm-amd module after running a
  guest in the VM, which goes through its noinstr code.
- The data breakpoint example of patch 10: with gcov on v7.4-rc4, a
  guest with one CPU hangs with breakpoints on jiffies_64 and on the
  counter that exc_debug_kernel() updates. With this series it keeps
  running.
- arm64 defconfig builds with gcov and MC/DC (GCC 16), and so do i386
  with gcov and UML with gcov and MC/DC.
- Clang 22 with GNU binutils, tinyconfig with source-based coverage and
  MC/DC: builds without warnings. The payload of the compressed kernel
  is 33 MB; with the coverage mapping left in, it would be 150 MB.
- objtool takes 240 instead of 233 seconds on the 4.8 GB vmlinux.o of
  the Clang build with source-based coverage.
- The series also applies to next-20261124, apart from the conflict
  mentioned above.

Tools
=====

AI coding assistants were used for this series: Claude for writing and
testing code and changelogs under my direction, the two objtool patches
in particular, and Codex for reviewing them. The testing is described
above.

Changes since v2 [6]
====================

- Rebased onto v7.4-rc4.
- Dropped "compiler_types.h: Don't instrument __always_inline functions
  for coverage". Patches 10 and 11 replace it and "objtool: Detect code
  coverage instrumentation in noinstr code": objtool removes the
  instrumentation from noinstr code instead of reporting it (Josh).
  Patch 10 explains why it has to go (Josh).
- Dropped "x86/entry: Stop excluding the entry code from KCOV". With
  CONFIG_KCOV_ENABLE_COMPARISONS it made KCOV go through the roughly 470
  cases of the system call dispatch switch on every system call.
- Patch 1: say what the move means for lcov.
- Patches 2 and 13: don't depend on CC_HAS_NO_PROFILE_FN_ATTR, which is
  always set and is being removed. Patch 2: drop a sentence from the
  COVERAGE_PROFILE_ALL help text that no longer applies (Nathan), and
  say how far the COMPILE_TEST default reaches.
- Patch 3: no common coverage/reset file and no reset callback. Each
  backend keeps a reset file in its own directory, named as in
  coverage/backend. Dropped the WARN_ON() in coverage_register_backend(),
  the backends are one Kconfig choice (Peter Oberparleiter).
- Patch 7: wrap the long lines.
- Patches 2 and 13: the rds selftest config script selects COVERAGE_NONE
  when it turns gcov off, and also turns source-based coverage off
  (Sashiko).
- Patch 13: added coverage/llvm/reset, and coverage/llvm/profraw has its
  size in debugfs. __llvm_covfun and __llvm_covmap, which Clang doesn't
  allocate, are placed outside of the image with the new
  LLVM_COV_MAPPING. In LLVM_COV_DATA they shifted the rest of the image
  with GNU ld, and with lld and the frame pointer unwinder they left
  __init_begin at 0, so the init memory was never freed (Sashiko).
  Patch 14 uses LLVM_COV_MAPPING in the x86 linker script, and takes
  the coverage mapping out of the payload of the compressed kernel,
  where GNU objcopy would keep it. The instrumented code is built with
  -fno-jump-tables, as Clang would otherwise keep the counters of a
  switch in a lookup table, out of objtool's reach.
- Patch 15: CC_OPT_WNO_PGO_COVERAGE in scripts/Kconfig.toolchain instead
  of cc-disable-warning (Nathan). The changelog no longer says that
  Clang before 22 can't build this with CONFIG_WERROR: it only warns.
- Patch 17: document the compiler versions (Nathan).
- Patch 18: simpler second COVERAGE_MCDC dependency (Peter Oberparleiter).
  Dropped the UML vDSO hunk, which had no effect: those objects aren't
  instrumented in the first place.
- Patch 19: document the reset convention and the noinstr handling as it
  is now, and that modules need a backend which supports them. Don't
  claim in gcov.rst that GCC warns about expressions it can't instrument
  for MC/DC, the series disables that warning.
- Added the Reviewed-by tags from Peter Oberparleiter (1 for gcov, 16,
  18), Nathan Chancellor (1, 2) and Sean Christopherson (9).

[1] https://lore.kernel.org/all/20240905043245.1389509-1-wentaoz5@illinois.edu/
[2] https://lore.kernel.org/all/20251014232639.673260-1-sashal@kernel.org/
[3] https://lore.kernel.org/all/20251015073701.GZ3419281@noisy.programming.kicks-ass.net/
[4] https://lore.kernel.org/all/20251218092439.GL3707891@noisy.programming.kicks-ass.net/
[5] https://lore.kernel.org/all/20260314141749.3382679-1-sashal@kernel.org/
[6] https://lore.kernel.org/all/20261103015238.3780910-1-sashal@kernel.org/
[7] https://lore.kernel.org/all/cover.1786230311.git.jpoimboe@kernel.org/

Sasha Levin (19):
  coverage: move gcov and kcov under kernel/coverage/
  kbuild: unify static coverage instrumentation as COVERAGE_PROFILE
  coverage: add a common debugfs interface
  context_tracking: Always inline the empty stubs called from noinstr
    code
  lockdep: Always inline the empty stubs called from noinstr code
  perf: Always inline the empty perf_lopwr_cb() stub
  rseq: Always inline the empty stubs called from noinstr code
  x86: Always inline empty stubs called from noinstr code
  x86/sev: Use non-instrumented bitops in the GHCB accessors
  objtool: Remove coverage counter updates from noinstr code
  objtool: Point the remaining coverage accesses in noinstr code at a
    sink
  x86/sev: Stop excluding noinstr.o from code coverage
  coverage: add Clang's source-based code coverage
  x86: Enable Clang's source-based code coverage
  coverage: add MC/DC measurement
  gcov: fix gcov_info_add() merge semantics for IOR counters
  kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
  gcov: add MC/DC condition coverage support
  Documentation: dev-tools: document the common code coverage interface

 Documentation/dev-tools/coverage.rst          | 173 +++++++++
 Documentation/dev-tools/gcov.rst              |  46 ++-
 Documentation/dev-tools/index.rst             |   1 +
 Documentation/dev-tools/kcov.rst              |   3 +
 .../translations/zh_CN/dev-tools/gcov.rst     |  16 +-
 .../translations/zh_TW/dev-tools/gcov.rst     |  16 +-
 MAINTAINERS                                   |  19 +-
 Makefile                                      |   1 +
 arch/Kconfig                                  |   8 +-
 arch/alpha/boot/compressed/Makefile           |   2 +-
 arch/parisc/kernel/vdso32/Makefile            |   2 +-
 arch/parisc/kernel/vdso64/Makefile            |   2 +-
 arch/powerpc/kernel/Makefile                  |   6 +-
 arch/powerpc/kernel/trace/Makefile            |   4 +-
 arch/powerpc/kexec/Makefile                   |   2 +-
 arch/powerpc/xmon/Makefile                    |   2 +-
 arch/s390/boot/Makefile                       |   2 +-
 arch/s390/kernel/Makefile                     |   2 +-
 arch/sh/mm/Makefile                           |   2 +-
 arch/x86/Kconfig                              |   2 +
 arch/x86/boot/compressed/Makefile             |   5 +
 arch/x86/coco/sev/Makefile                    |   2 -
 arch/x86/include/asm/processor.h              |   2 +-
 arch/x86/include/asm/sev.h                    |   6 +-
 arch/x86/include/asm/svm.h                    |   8 +-
 arch/x86/kernel/vmlinux.lds.S                 |   3 +
 arch/x86/platform/efi/Makefile                |   2 +-
 arch/xtensa/boot/lib/Makefile                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |  12 +-
 drivers/gpu/drm/amd/amdgpu/Makefile           |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   2 +-
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/s390/char/Makefile                    |   2 +-
 include/asm-generic/vmlinux.lds.h             |  35 ++
 include/linux/context_tracking.h              |   8 +-
 include/linux/irqflags.h                      |   6 +-
 include/linux/lockdep.h                       |   4 +-
 include/linux/perf_event.h                    |   2 +-
 include/linux/rseq_entry.h                    |  19 +-
 include/linux/sched.h                         |   2 +-
 init/Kconfig                                  |   9 +-
 io_uring/Makefile                             |   4 +-
 kernel/Makefile                               |  15 +-
 kernel/coverage/Kconfig                       | 226 +++++++++++
 kernel/coverage/Makefile                      |  18 +
 kernel/coverage/core.c                        |  47 +++
 kernel/coverage/coverage.h                    |  22 ++
 kernel/{ => coverage}/gcov/Makefile           |   0
 kernel/{ => coverage}/gcov/base.c             |   0
 kernel/{ => coverage}/gcov/clang.c            |   2 +-
 kernel/{ => coverage}/gcov/fs.c               |   8 +
 kernel/{ => coverage}/gcov/gcc_4_7.c          |  25 +-
 kernel/{ => coverage}/gcov/gcc_base.c         |   0
 kernel/{ => coverage}/gcov/gcov.h             |   0
 kernel/{ => coverage}/kcov.c                  |   3 +
 kernel/coverage/llvm/Makefile                 |   4 +
 kernel/coverage/llvm/fs.c                     | 219 +++++++++++
 kernel/coverage/llvm/llvm-cov.h               | 139 +++++++
 kernel/gcov/Kconfig                           |  55 ---
 kernel/trace/Kconfig                          |   9 +-
 kernel/trace/Makefile                         |   4 +-
 lib/Kconfig.debug                             |  61 +--
 lib/Makefile                                  |   2 +-
 lib/crypto/Makefile                           |   2 +-
 net/bridge/Makefile                           |   8 +-
 net/bridge/netfilter/Makefile                 |   4 +-
 net/ipv4/Makefile                             |   4 +-
 net/ipv4/netfilter/Makefile                   |   4 +-
 net/ipv6/Makefile                             |   4 +-
 net/ipv6/netfilter/Makefile                   |   4 +-
 net/netfilter/Kconfig                         |   9 +-
 net/netfilter/Makefile                        |   4 +-
 net/netfilter/ipset/Kconfig                   |   9 +-
 net/netfilter/ipset/Makefile                  |   4 +-
 net/netfilter/ipvs/Kconfig                    |   9 +-
 net/netfilter/ipvs/Makefile                   |   4 +-
 net/rds/Kconfig                               |   9 +-
 net/rds/Makefile                              |   4 +-
 scripts/Kconfig.toolchain                     |  10 +
 scripts/Makefile.gcov                         |  17 +-
 scripts/Makefile.lib                          |  19 +-
 scripts/Makefile.llvm-cov                     |  17 +
 scripts/Makefile.modfinal                     |   2 +-
 scripts/sbom/sbom/environment.py              |   2 +-
 tools/objtool/arch/x86/decode.c               | 121 +++++-
 tools/objtool/check.c                         | 353 ++++++++++++++++++
 tools/objtool/include/objtool/arch.h          |   2 +
 tools/objtool/include/objtool/elf.h           |   1 +
 tools/testing/selftests/net/rds/config.sh     |  12 +-
 tools/testing/selftests/net/rds/rds_run.sh    |   8 +-
 tools/unittests/test_cmatch.py                |   2 +-
 92 files changed, 1663 insertions(+), 298 deletions(-)
 create mode 100644 Documentation/dev-tools/coverage.rst
 create mode 100644 kernel/coverage/Kconfig
 create mode 100644 kernel/coverage/Makefile
 create mode 100644 kernel/coverage/core.c
 create mode 100644 kernel/coverage/coverage.h
 rename kernel/{ => coverage}/gcov/Makefile (100%)
 rename kernel/{ => coverage}/gcov/base.c (100%)
 rename kernel/{ => coverage}/gcov/clang.c (99%)
 rename kernel/{ => coverage}/gcov/fs.c (98%)
 rename kernel/{ => coverage}/gcov/gcc_4_7.c (94%)
 rename kernel/{ => coverage}/gcov/gcc_base.c (100%)
 rename kernel/{ => coverage}/gcov/gcov.h (100%)
 rename kernel/{ => coverage}/kcov.c (99%)
 create mode 100644 kernel/coverage/llvm/Makefile
 create mode 100644 kernel/coverage/llvm/fs.c
 create mode 100644 kernel/coverage/llvm/llvm-cov.h
 delete mode 100644 kernel/gcov/Kconfig
 create mode 100644 scripts/Makefile.llvm-cov


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

