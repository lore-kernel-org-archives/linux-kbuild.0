Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39605 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726832AbfKJQbZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 11:31:25 -0500
Subject: [net-next PATCH] samples/bpf: adjust Makefile and README.rst
From: Jesper Dangaard Brouer <brouer@redhat.com>
Date: Sun, 10 Nov 2019 17:31:16 +0100
Message-ID: <157340347607.14617.683175264051058224.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Jesper Dangaard Brouer <brouer@redhat.com>, Daniel Borkmann <borkmann@iogearbox.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>

Side effect of some kbuild changes resulted in breaking the
documented way to build samples/bpf/.

This patch change the samples/bpf/Makefile to work again, when
invoking make from the subdir samples/bpf/. Also update the
documentation in README.rst, to reflect the new way to build.

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 samples/bpf/Makefile   |    4 ++--
 samples/bpf/README.rst |   12 +++++-------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index d88c01275239..8e32a4d29a38 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -203,7 +203,7 @@ TPROGLDLIBS_test_overhead=09+=3D -lrt
 TPROGLDLIBS_xdpsock=09=09+=3D -pthread
=20
 # Allows pointing LLC/CLANG to a LLVM backend with bpf support, redefine o=
n cmdline:
-#  make samples/bpf/ LLC=3D~/git/llvm/build/bin/llc CLANG=3D~/git/llvm/bui=
ld/bin/clang
+#  make M=3Dsamples/bpf/ LLC=3D~/git/llvm/build/bin/llc CLANG=3D~/git/llvm=
/build/bin/clang
 LLC ?=3D llc
 CLANG ?=3D clang
 LLVM_OBJCOPY ?=3D llvm-objcopy
@@ -246,7 +246,7 @@ endif
=20
 # Trick to allow make to be run from this directory
 all:
-=09$(MAKE) -C ../../ $(CURDIR)/ BPF_SAMPLES_PATH=3D$(CURDIR)
+=09$(MAKE) -C ../../ M=3D$(CURDIR) BPF_SAMPLES_PATH=3D$(CURDIR)
=20
 clean:
 =09$(MAKE) -C ../../ M=3D$(CURDIR) clean
diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
index cc1f00a1ee06..dd34b2d26f1c 100644
--- a/samples/bpf/README.rst
+++ b/samples/bpf/README.rst
@@ -46,12 +46,10 @@ Compiling
 For building the BPF samples, issue the below command from the kernel
 top level directory::
=20
- make samples/bpf/
-
-Do notice the "/" slash after the directory name.
+ make M=3Dsamples/bpf
=20
 It is also possible to call make from this directory.  This will just
-hide the the invocation of make as above with the appended "/".
+hide the invocation of make as above.
=20
 Manually compiling LLVM with 'bpf' support
 ------------------------------------------
@@ -77,7 +75,7 @@ Quick sniplet for manually compiling LLVM and clang
 It is also possible to point make to the newly compiled 'llc' or
 'clang' command via redefining LLC or CLANG on the make command line::
=20
- make samples/bpf/ LLC=3D~/git/llvm/build/bin/llc CLANG=3D~/git/llvm/build=
/bin/clang
+ make M=3Dsamples/bpf LLC=3D~/git/llvm/build/bin/llc CLANG=3D~/git/llvm/bu=
ild/bin/clang
=20
 Cross compiling samples
 -----------------------
@@ -98,10 +96,10 @@ Pointing LLC and CLANG is not necessarily if it's insta=
lled on HOST and have
 in its targets appropriate arm64 arch (usually it has several arches).
 Build samples::
=20
- make samples/bpf/
+ make M=3Dsamples/bpf
=20
 Or build samples with SYSROOT if some header or library is absent in toolc=
hain,
 say libelf, providing address to file system containing headers and libs,
 can be RFS of target board::
=20
- make samples/bpf/ SYSROOT=3D~/some_sysroot
+ make M=3Dsamples/bpf SYSROOT=3D~/some_sysroot
