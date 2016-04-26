Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44671 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752703AbcDZQ1X (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 12:27:23 -0400
Subject: [net-next PATCH V2 3/5] samples/bpf: add a README file to get users
 started
From: Jesper Dangaard Brouer <brouer@redhat.com>
Date: Tue, 26 Apr 2016 18:27:22 +0200
Message-ID: <20160426162721.22962.25054.stgit@firesoul>
In-Reply-To: <20160426162650.22962.20516.stgit@firesoul>
References: <20160426162650.22962.20516.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: netdev@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, Jesper Dangaard Brouer <brouer@redhat.com>, naveen.n.rao@linux.vnet.ibm.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

Getting started with using examples in samples/bpf/ is not
straightforward.  There are several dependencies, and specific
versions of these dependencies.

Just compiling the example tool is also slightly obscure, e.g. one
need to call make like:

 make samples/bpf/

Do notice the "/" slash after the directory name.

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 samples/bpf/README.rst |   77 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 samples/bpf/README.rst

diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
new file mode 100644
index 000000000000..c7ccf553af0d
--- /dev/null
+++ b/samples/bpf/README.rst
@@ -0,0 +1,77 @@
+eBPF sample programs
+====================
+
+This kernel samples/bpf directory contains a mini eBPF library, test
+stubs, verifier test-suite and examples for using eBPF.
+
+Build dependencies
+==================
+
+Compiling requires having installed:
+ * clang
+ * llvm >= version 3.7.1
+
+Note that LLVM's tool 'llc' must support target 'bpf', list with command::
+
+ $ llc --version
+ LLVM (http://llvm.org/):
+  LLVM version 3.x.y
+  [...]
+  Host CPU: xxx
+
+  Registered Targets:
+    [...]
+    bpf        - BPF (host endian)
+    bpfeb      - BPF (big endian)
+    bpfel      - BPF (little endian)
+    [...]
+
+Kernel headers
+--------------
+
+There are usually dependencies to header files of the current kernel.
+To avoid installing devel kernel headers system wide, as a normal
+user, simply call::
+
+ make headers_install
+
+This will creates a local "usr/include" directory in the git/build top
+level directory, that the make system automatically pickup first.
+
+Compiling
+=========
+
+For compiling goto kernel top level build directory and run make like::
+
+ make samples/bpf/
+
+Do notice the "/" slash after the directory name.
+
+Manually compiling LLVM with 'bpf' support
+------------------------------------------
+
+In some LLVM versions the BPF target were marked experimental. They
+needed the 'cmake .. -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=BPF'.  Since
+version 3.7.1, LLVM adds a proper LLVM backend target for the BPF
+bytecode architecture.
+
+By default llvm will build all non-experimental backends including bpf.
+To generate a smaller llc binary one can use::
+
+ -DLLVM_TARGETS_TO_BUILD="BPF;X86"
+
+Quick sniplet for manually compiling LLVM and clang
+(build dependencies are cmake and gcc-c++)::
+
+ $ git clone http://llvm.org/git/llvm.git
+ $ cd llvm/tools
+ $ git clone --depth 1 http://llvm.org/git/clang.git
+ $ cd ..; mkdir build; cd build
+ $ cmake .. -DLLVM_TARGETS_TO_BUILD="BPF;X86"
+ $ make -j $(getconf _NPROCESSORS_ONLN)
+
+It is also possible to point make to the newly compile 'llc' command
+via redefining LLC on the make command line::
+
+ make samples/bpf/ LLC=~/git/llvm/build/bin/llc
+

