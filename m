Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:34844 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWHmN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:42:13 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 00/16] kbuild: support 'userprogs' syntax
Date: Thu, 23 Apr 2020 16:39:13 +0900
Message-Id: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Christian Brauner <christian@brauner.io>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Jonathan Corbet <corbet@lwn.net>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Michal Marek <michal.lkml@markovi.net>, Song Liu <songliubraving@fb.com>, Tomas Winkler <tomas.winkler@intel.com>, Yonghong Song <yhs@fb.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org


Several Makefiles use 'hostprogs' for building the code for
the host architecture is not appropriate.

This is just because Kbuild does not provide the syntax to do it.

This series introduce 'userprogs' syntax and use it from
sample and bpf Makefiles.

Sam worked on this in 2014.
https://lkml.org/lkml/2014/7/13/154

He used 'uapiprogs-y' but I just thought the meaning of
"UAPI programs" is unclear.

Naming is one the most difficult parts of this.

I chose 'userprogs'.
Anothor choice I had in my mind was 'targetprogs'.

If you can test this series quickly by
'make allmodconfig samples/'

When building objects for userspace, [U] is displayed.

masahiro@oscar:~/workspace/linux$ make allmodconfig samples/
  [snip]
  AR      samples/vfio-mdev/built-in.a
  CC [M]  samples/vfio-mdev/mtty.o
  CC [M]  samples/vfio-mdev/mdpy.o
  CC [M]  samples/vfio-mdev/mdpy-fb.o
  CC [M]  samples/vfio-mdev/mbochs.o
  AR      samples/mei/built-in.a
  CC [U]  samples/mei/mei-amt-version
  CC [U]  samples/auxdisplay/cfag12864b-example
  CC [M]  samples/configfs/configfs_sample.o
  CC [M]  samples/connector/cn_test.o
  CC [U]  samples/connector/ucon
  CC [M]  samples/ftrace/ftrace-direct.o
  CC [M]  samples/ftrace/ftrace-direct-too.o
  CC [M]  samples/ftrace/ftrace-direct-modify.o
  CC [M]  samples/ftrace/sample-trace-array.o
  CC [U]  samples/hidraw/hid-example
  CC [M]  samples/hw_breakpoint/data_breakpoint.o
  CC [M]  samples/kdb/kdb_hello.o
  CC [M]  samples/kfifo/bytestream-example.o
  CC [M]  samples/kfifo/dma-example.o
  CC [M]  samples/kfifo/inttype-example.o
  CC [M]  samples/kfifo/record-example.o
  CC [M]  samples/kobject/kobject-example.o
  CC [M]  samples/kobject/kset-example.o
  CC [M]  samples/kprobes/kprobe_example.o
  CC [M]  samples/kprobes/kretprobe_example.o
  CC [M]  samples/livepatch/livepatch-sample.o
  CC [M]  samples/livepatch/livepatch-shadow-mod.o
  CC [M]  samples/livepatch/livepatch-shadow-fix1.o
  CC [M]  samples/livepatch/livepatch-shadow-fix2.o
  CC [M]  samples/livepatch/livepatch-callbacks-demo.o
  CC [M]  samples/livepatch/livepatch-callbacks-mod.o
  CC [M]  samples/livepatch/livepatch-callbacks-busymod.o
  CC [M]  samples/rpmsg/rpmsg_client_sample.o
  CC [U]  samples/seccomp/bpf-fancy.o
  CC [U]  samples/seccomp/bpf-helper.o
  LD [U]  samples/seccomp/bpf-fancy
  CC [U]  samples/seccomp/dropper
  CC [U]  samples/seccomp/bpf-direct
  CC [U]  samples/seccomp/user-trap
  CC [U]  samples/timers/hpet_example
  CC [M]  samples/trace_events/trace-events-sample.o
  CC [M]  samples/trace_printk/trace-printk.o
  CC [U]  samples/uhid/uhid-example
  CC [M]  samples/v4l/v4l2-pci-skeleton.o
  CC [U]  samples/vfs/test-fsmount
  CC [U]  samples/vfs/test-statx
samples/vfs/test-statx.c:24:15: warning: ‘struct foo’ declared inside parameter list will not be visible outside of this definition or declaration
   24 | #define statx foo
      |               ^~~
  CC [U]  samples/watchdog/watchdog-simple
  AR      samples/built-in.a



Masahiro Yamada (15):
  Documentation: kbuild: fix the section title format
  Revert "objtool: Skip samples subdirectory"
  kbuild: add infrastructure to build userspace programs
  net: bpfilter: use 'userprogs' syntax to build bpfilter_umh
  samples: seccomp: build sample programs for target architecture
  kbuild: doc: document the new syntax 'userprogs'
  samples: uhid: build sample program for target architecture
  samples: hidraw: build sample program for target architecture
  samples: connector: build sample program for target architecture
  samples: vfs: build sample programs for target architecture
  samples: pidfd: build sample program for target architecture
  samples: mei: build sample program for target architecture
  samples: auxdisplay: use 'userprogs' syntax
  samples: timers: use 'userprogs' syntax
  samples: watchdog: use 'userprogs' syntax

Sam Ravnborg (1):
  samples: uhid: fix warnings in uhid-example

 Documentation/kbuild/makefiles.rst | 185 +++++++++++++++++++++--------
 Makefile                           |  11 +-
 net/bpfilter/Makefile              |  11 +-
 samples/Kconfig                    |  26 +++-
 samples/Makefile                   |   5 +-
 samples/auxdisplay/Makefile        |  11 +-
 samples/connector/Makefile         |  12 +-
 samples/hidraw/Makefile            |   9 +-
 samples/mei/Makefile               |   9 +-
 samples/pidfd/Makefile             |   8 +-
 samples/seccomp/Makefile           |  42 +------
 samples/timers/Makefile            |  17 +--
 samples/uhid/.gitignore            |   2 +
 samples/uhid/Makefile              |   9 +-
 samples/uhid/uhid-example.c        |   4 +-
 samples/vfs/Makefile               |  11 +-
 samples/watchdog/Makefile          |  10 +-
 scripts/Makefile.build             |   5 +
 scripts/Makefile.clean             |   2 +-
 scripts/Makefile.userprogs         |  44 +++++++
 20 files changed, 258 insertions(+), 175 deletions(-)
 create mode 100644 samples/uhid/.gitignore
 create mode 100644 scripts/Makefile.userprogs

-- 
2.25.1
