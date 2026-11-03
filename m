Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670766;
	b=ifZ02IGsVqlo+3W9zBS0cu63roOL8Kh4gOuYAx7wPsf7QDox8lxfo0snbrccyKlo+k18
	 R1d8Yn8piJRBYQLWZjyXjYoXqIs4/SyyGJVokic5cH/QZmbIVlzisX4PpLK7ACQxpNrbm
	 MaqxnaiIk/ySi1J4Hv8WoIJiBmQWy0uN/+vOfplbkCI/R00ki4Pe0l2Dskl1n++wupCIJ
	 kwEFrWvAPlY44FlqA3tKkEhbW4+SVB7QBO2VMjtnBP0FbbJI5uPyAmFQS9kbuQN8eNyLA
	 gTxDsuRtiHxHyir69VzEvIt8Ch5ifynumI/kkCdFaqjOGFjzlDOiZAEOHP65XCCZrsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670766;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cin+a2w3Wa+uRmTw62K8l4STzJsIkbln99YEwOKoo+M=;
	b=oXEtZCjDU19tKlkpGlkqryrqMfWG19HuF7NIP+dfVfcwr9xsdDnXgYw00qOXs+PzvwBe
	 KsMaQjWViIuJzc2XD4GrWJlfFgZtunnaAOI4V0CoZvv8MEuZX8OhPcz/qPqmaORcSYh4Y
	 2fEdcBZGFNF1YatyelM1IsSDTgLCNUari/5L7PQpuU1nMxUApOO1nJEqt4cnHrfmBwi0n
	 wbUgW4eJD9YgAyg5HjMre/WMoc+5ioJigW0tgxo/Ilf2WwRcu4hUyRrHKswDUoc43mDjW
	 6GLZJX59bKQaf2RlPlsgvOJvbTrPiYvOpMifPZWjc5MI/KXxF+Qhi5EFABC1q2H4bmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IKa/DuxM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B28606A324;
	Tue,  3 Nov 2026 01:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKa/DuxM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2358A1F000C1;
	Tue,  3 Nov 2026 01:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670765;
	bh=cin+a2w3Wa+uRmTw62K8l4STzJsIkbln99YEwOKoo+M=;
	h=From:To:Cc:Subject:Date;
	b=IKa/DuxM3f7tbKux0k0nyZ8E6Ei9Qor1XU13BLiSmhJzGKO9pjpBxMnqnhcZ7/YDw
	 88mY34VlGv2F2CgAwYVGQqFww8qnPsSkDWlX/lyFy5tWaBO9f/mybMXorDoWUZR1RP
	 7tHB42gqj/HMuM4B+sD7bSmGh4aVns7gUpAeD/9KqwBswUbyTwm6q8NAjT1C1M3jUP
	 mhvQINpbKVQYwXP44u7oLis9hZBXakFVGH8k3fKl+ZrjWBERK1u3l5vbrhz51aoScy
	 L/EwlG9whlJ7bRtiO9oe6p3LlQ0P/fGhkDFwbO84FBxSDTkiLC2UhnjFYLdYe6L3vB
	 gMyHAGcnO3sbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Potapenko <glider@google.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
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
	kasan-dev@googlegroups.com,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	x86@kernel.org,
	Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH v2 00/20] Unify code coverage and add Clang source-based coverage with MC/DC
Date: Mon,  2 Nov 2026 20:52:18 -0500
Message-ID: <20261103015238.3780910-1-sashal@kernel.org>
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
    core.c, coverage.h   debugfs root, backend registration, common reset
    gcov/                gcov backend (moved from kernel/gcov/)
    llvm/                Clang source-based coverage backend (new)
    kcov.c               KCOV (moved from kernel/kcov.c)

A code coverage measurement implementation, or backend, only provides
what is specific to its toolchain:

- its compiler flags, as CFLAGS_COVERAGE in scripts/Makefile.<backend>,
  including the ones for MC/DC;
- a struct coverage_backend registered with the core: its name, its
  enabled features and how to reset its data;
- its data, reachable under /sys/kernel/debug/coverage/;
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
  the backend and its features, "reset" resetting its data, and the
  backend's data files. The existing gcov and kcov entries stay where
  they are, for lcov and syzkaller, and are linked from there.
- noinstr: one mechanism for all backends, see below.

With that in place, adding source-based coverage (patch 14) only takes
the backend specific parts.

KCOV is a per-task tracing interface for fuzzers with its own UAPI, so it
is not a backend: it moves into kernel/coverage/, the same menu, the same
debugfs root and the same documentation, and its noinstr handling is
unified, but it keeps its UAPI and KCOV_INSTRUMENT, whose exclusions serve
the fuzzing signal and the KCOV runtime rather than marking code that
can't be instrumented.

noinstr
=======

gcov and source-based coverage instrument the code before inlining, so
__always_inline helpers carried their counters into noinstr code: in an
x86 build, 2833 relocations in .noinstr.text and .cpuidle.text referenced
coverage counters. objtool didn't notice, as these are plain memory
updates rather than calls. KCOV instruments after inlining and was not
affected.

- Patch 4 stops instrumenting __always_inline functions in coverage
  builds, which costs about 1-2% of the coverage data. Neither GCC nor
  Clang can drop instrumentation that inlining moves into a noinstr
  function, so this is needed until they can.
- Patches 5-10 make the empty stubs that noinstr code calls
  __always_inline, and switch the GHCB accessors to the arch_ bitops.
- Patch 11 makes objtool report coverage counter updates in noinstr code.
- Patches 12 and 13 drop the coverage exclusions that only existed for
  noinstr: arch/x86/coco/sev/noinstr.o, added by commit 9efb74f84ba8
  ("x86/sev: Disable GCOV on noinstr object"), and the KCOV exclusion of
  the x86 entry code. The generic entry code stays excluded from KCOV for
  a different reason, which patch 13 documents.

objtool only validates noinstr code on x86. On other architectures,
patch 4 removes the instrumentation that comes from __always_inline
functions, but nothing checks for plain static inline helpers that
noinstr code uses. On arm64 with gcov profiling the whole kernel, Clang
22 leaves no coverage counters in .noinstr.text (4129 without this
series), and calls from noinstr code to out of line copies of trivial
helpers go from 35 to 27. GCC inlines helpers such as
__kern_my_cpu_offset() and preempt_count() after instrumenting them, so
about 190 counters remain there, as without this series. Making those
helpers __always_inline, as on x86, is left to follow-up work.

Source-based coverage and MC/DC
===============================

Patches 14-20 add Clang's source-based code coverage for code built into
the kernel image (raw profile formats of Clang 19-22 and 23+), enable it
on x86_64, add MC/DC measurement for it and for gcov with GCC 14+ [5],
including the gcov merge fix MC/DC needs, and document the result.

Merging
=======

The series touches kbuild, x86, objtool, gcov and KCOV. gcov and KCOV
changes usually go through Andrew's tree, so I'd suggest taking it there,
with acks from the x86, objtool and kbuild maintainers.

Testing
=======

On v7.4-rc1:

- x86_64 with CONFIG_DEBUG_ENTRY: every patch builds with GCC 16 (gcov,
  KCOV and CONFIG_WERROR; gcov with MC/DC, lockdep and CONFIG_RSEQ=n from
  patch 8 on) and, from patch 14 on, with Clang 24 (source-based coverage
  with MC/DC, and KCOV). gcov with GCC 16 and source-based coverage with
  Clang 19, 22 and 24, with MC/DC, lockdep and CONFIG_RSEQ on and off:
  objtool is clean and no coverage counter is left in noinstr code.
  Without patch 4, objtool reports coverage counter updates in 60 noinstr
  functions.
- arm64 builds with gcov (GCC 15 and Clang 22), and so do i386 and UML.
- Booted in a VM: gcov and source-based coverage data, reset, MC/DC
  reports from llvm-cov and gcov --conditions, gcov data of a module
  across reloads, and KCOV through both /sys/kernel/debug/kcov and
  /sys/kernel/debug/coverage/kcov.
- Kernels without coverage produce identical compiler invocations.

Changes since the RFC [6]
=========================

- Rebased onto v7.4-rc1. Patch 2 builds on scripts/Makefile.gcov from
  commit f541906e89f9 ("kbuild: move GCOV flags to scripts/Makefile.gcov")
  and only renames the variable there.
- Patch 4: no exception for unoptimized objects, none of them needs one
  (Peter).
- Patch 8: make all the !CONFIG_RSEQ stubs, and the !CONFIG_GENERIC_ENTRY
  rseq_exit_to_user_mode_restart() stub, __always_inline (Sashiko).
- Patch 11: cache the counter classification in struct symbol, and fold
  the check into the existing noinstr conditional (Peter).
- Patches 16, 19 and 20: disable the warnings about decisions that MC/DC
  leaves out instead of keeping them from becoming errors; building with
  KCFLAGS=-Wpgo-coverage or -Wcoverage-too-many-conditions lists them
  (Nathan).

[1] https://lore.kernel.org/all/20240905043245.1389509-1-wentaoz5@illinois.edu/
[2] https://lore.kernel.org/all/20251014232639.673260-1-sashal@kernel.org/
[3] https://lore.kernel.org/all/20251015073701.GZ3419281@noisy.programming.kicks-ass.net/
[4] https://lore.kernel.org/all/20251218092439.GL3707891@noisy.programming.kicks-ass.net/
[5] https://lore.kernel.org/all/20260314141749.3382679-1-sashal@kernel.org/
[6] https://lore.kernel.org/all/20261028120034.871983-1-sashal@kernel.org/

Sasha Levin (20):
  coverage: move gcov and kcov under kernel/coverage/
  kbuild: unify static coverage instrumentation as COVERAGE_PROFILE
  coverage: add a common debugfs interface
  compiler_types.h: Don't instrument __always_inline functions for
    coverage
  context_tracking: Always inline the empty stubs called from noinstr
    code
  lockdep: Always inline the empty stubs called from noinstr code
  perf: Always inline the empty perf_lopwr_cb() stub
  rseq: Always inline the empty stubs called from noinstr code
  x86: Always inline empty stubs called from noinstr code
  x86/sev: Use non-instrumented bitops in the GHCB accessors
  objtool: Detect code coverage instrumentation in noinstr code
  x86/sev: Stop excluding noinstr.o from code coverage
  x86/entry: Stop excluding the entry code from KCOV
  coverage: add Clang's source-based code coverage
  x86: Enable Clang's source-based code coverage
  coverage: add MC/DC measurement
  gcov: fix gcov_info_add() merge semantics for IOR counters
  kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
  gcov: add MC/DC condition coverage support
  Documentation: dev-tools: document the common code coverage interface

 Documentation/dev-tools/coverage.rst          | 161 +++++++++++++
 Documentation/dev-tools/gcov.rst              |  46 +++-
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
 arch/x86/coco/sev/Makefile                    |   2 -
 arch/x86/entry/Makefile                       |   1 -
 arch/x86/include/asm/processor.h              |   2 +-
 arch/x86/include/asm/sev.h                    |   6 +-
 arch/x86/include/asm/svm.h                    |   8 +-
 arch/x86/kernel/vmlinux.lds.S                 |   2 +
 arch/x86/platform/efi/Makefile                |   2 +-
 arch/x86/um/vdso/Makefile                     |   4 +-
 arch/xtensa/boot/lib/Makefile                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |  12 +-
 drivers/gpu/drm/amd/amdgpu/Makefile           |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   2 +-
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/s390/char/Makefile                    |   2 +-
 include/asm-generic/vmlinux.lds.h             |  36 +++
 include/linux/compiler_types.h                |  11 +
 include/linux/context_tracking.h              |   8 +-
 include/linux/irqflags.h                      |   6 +-
 include/linux/lockdep.h                       |   4 +-
 include/linux/perf_event.h                    |   2 +-
 include/linux/rseq_entry.h                    |  14 +-
 include/linux/sched.h                         |   2 +-
 init/Kconfig                                  |   9 +-
 io_uring/Makefile                             |   4 +-
 kernel/Makefile                               |  15 +-
 kernel/coverage/Kconfig                       | 226 ++++++++++++++++++
 kernel/coverage/Makefile                      |  18 ++
 kernel/coverage/core.c                        |  71 ++++++
 kernel/coverage/coverage.h                    |  22 ++
 kernel/{ => coverage}/gcov/Makefile           |   0
 kernel/{ => coverage}/gcov/base.c             |   0
 kernel/{ => coverage}/gcov/clang.c            |   2 +-
 kernel/{ => coverage}/gcov/fs.c               |  22 +-
 kernel/{ => coverage}/gcov/gcc_4_7.c          |  25 +-
 kernel/{ => coverage}/gcov/gcc_base.c         |   0
 kernel/{ => coverage}/gcov/gcov.h             |   0
 kernel/{ => coverage}/kcov.c                  |   3 +
 kernel/coverage/llvm/Makefile                 |   4 +
 kernel/coverage/llvm/fs.c                     | 202 ++++++++++++++++
 kernel/coverage/llvm/llvm-cov.h               | 139 +++++++++++
 kernel/entry/Makefile                         |   3 +
 kernel/gcov/Kconfig                           |  55 -----
 kernel/trace/Kconfig                          |   9 +-
 kernel/trace/Makefile                         |   4 +-
 lib/Kconfig.debug                             |  61 +----
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
 scripts/Kconfig.toolchain                     |   3 +
 scripts/Makefile.gcov                         |  17 +-
 scripts/Makefile.lib                          |  19 +-
 scripts/Makefile.llvm-cov                     |  15 ++
 scripts/Makefile.modfinal                     |   2 +-
 scripts/sbom/sbom/environment.py              |   2 +-
 tools/objtool/check.c                         |  60 ++++-
 tools/objtool/include/objtool/elf.h           |   1 +
 tools/testing/selftests/net/rds/config.sh     |   9 +-
 tools/testing/selftests/net/rds/rds_run.sh    |   8 +-
 tools/unittests/test_cmatch.py                |   2 +-
 93 files changed, 1247 insertions(+), 304 deletions(-)
 create mode 100644 Documentation/dev-tools/coverage.rst
 create mode 100644 kernel/coverage/Kconfig
 create mode 100644 kernel/coverage/Makefile
 create mode 100644 kernel/coverage/core.c
 create mode 100644 kernel/coverage/coverage.h
 rename kernel/{ => coverage}/gcov/Makefile (100%)
 rename kernel/{ => coverage}/gcov/base.c (100%)
 rename kernel/{ => coverage}/gcov/clang.c (99%)
 rename kernel/{ => coverage}/gcov/fs.c (97%)
 rename kernel/{ => coverage}/gcov/gcc_4_7.c (94%)
 rename kernel/{ => coverage}/gcov/gcc_base.c (100%)
 rename kernel/{ => coverage}/gcov/gcov.h (100%)
 rename kernel/{ => coverage}/kcov.c (99%)
 create mode 100644 kernel/coverage/llvm/Makefile
 create mode 100644 kernel/coverage/llvm/fs.c
 create mode 100644 kernel/coverage/llvm/llvm-cov.h
 delete mode 100644 kernel/gcov/Kconfig
 create mode 100644 scripts/Makefile.llvm-cov


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

