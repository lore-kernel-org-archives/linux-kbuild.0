Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41067 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754479AbaHUNqi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Aug 2014 09:46:38 -0400
Date: Thu, 21 Aug 2014 15:46:35 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v2 0/6] kbuild: use target compiler for user binaries in
 samples/
Message-ID: <20140821134635.GA25607@sepie.suse.cz>
References: <20140713183636.GA17241@ravnborg.org>
 <20140714102936.73f43591@canb.auug.org.au>
 <20140714103357.33d3bdc7@canb.auug.org.au>
 <53C7EA2A.6050301@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53C7EA2A.6050301@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, David Herrmann <dh.herrmann@googlemail.com>, Jiri Kosina <jkosina@suse.cz>

On Thu, Jul 17, 2014 at 05:22:18PM +0200, Michal Marek wrote:
> On 2014-07-14 02:33, Stephen Rothwell wrote:
> > Hi Sam,
> > 
> > On Mon, 14 Jul 2014 10:29:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> On Sun, 13 Jul 2014 20:36:37 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> >>>
> >>> NOTE: This will likely break the build if the toolchain used do
> >>> not include a libc. Let's see how much noise this creates.
> >>
> >> Then I will drop them from linux-next.  Until someone supplies lots of
> >> cross compilers with libc support, the samples can not (must not) be
> >> built by default.
> > 
> > Just to be clear: for my current build infrastructure, this means
> > powerpc and x86_64 hosted cross compilers.
> 
> So we basically can have zero, one or both of
> A) target toolchain with libc support
> B) host toolchain with recent enough kernel headers
> 
> Just can idea - in case we have B, but not A, would it make sense to
> build $(uapiprogs-y) with the host compiler, but without the
> -Iusr/include flag?

Actually, we can build with the host compiler against the exported
headers, these just need to be exported for the right architecture.
How about the following patch (applies on top of 1/6 of
this series)? It creates a usr/host/include tree with headers for the
host architecture and builds the uapiprogs with the host compiler. This
should build in all scenarios that work today. The only downside is that
when cross-compiling, the sample binaries continue to be somewhat
impractical. But it is not _that_ difficult to build them by hand,
provided one has a complete cross-compiling setup.

Michal

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6b691d3b..6466704 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -233,8 +233,3 @@ KBUILD_VMLINUX_MAIN
 All object files for the main part of vmlinux.
 KBUILD_VMLINUX_INIT and KBUILD_VMLINUX_MAIN together specify
 all the object files used to link vmlinux.
-
-UAPICFLAGS
---------------------------------------------------
-Arch specific flags used when building sample binaries.
-This is usually the machine size (32 versus 64 bit).
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 2c6d53b..163d5dd 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -746,7 +746,7 @@ Kbuild support building sample modules and sample binaries.
 To build sample modules the existing infrastructure is used, but
 to build sample binaries kbuild adds dedicated suppport.
 
-The sample binaries are build for the same host and bit-size as the kernel.
+The sample binaries are build for the architecture of the build host.
 
 The samples may demonstrate facilities not yet available
 in the installed libc therefore they are build so they include
diff --git a/Makefile b/Makefile
index 9f654a4..66073f2 100644
--- a/Makefile
+++ b/Makefile
@@ -968,11 +968,13 @@ prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
 
 archprepare: archheaders archscripts prepare1 scripts_basic
 
-# To build userspace samples the uapi headers needs to be exported
+# To build userspace samples the uapi headers need to be exported for
+# the host architecture
 prepare0: archprepare FORCE
 	$(Q)$(MAKE) $(build)=.
 ifdef CONFIG_SAMPLES
-	$(Q)$(MAKE) KBUILD_SRC= headers_install
+	$(MAKE) KBUILD_SRC= ARCH=$(SUBARCH) \
+		INSTALL_HDR_PATH=usr/host headers_install
 endif
 
 # All the preparing..
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 4b32933..874e6d6 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -18,7 +18,6 @@ LD_BFD		:= elf32-s390
 LDFLAGS		:= -m elf_s390
 KBUILD_CFLAGS	+= -m31
 KBUILD_AFLAGS	+= -m31
-UAPICFLAGS	+= -m31
 UTS_MACHINE	:= s390
 STACK_SIZE	:= 8192
 CHECKFLAGS	+= -D__s390__ -msize-long
@@ -29,7 +28,6 @@ KBUILD_AFLAGS_MODULE += -fPIC
 KBUILD_CFLAGS_MODULE += -fPIC
 KBUILD_CFLAGS	+= -m64
 KBUILD_AFLAGS	+= -m64
-UAPICFLAGS	+= -m64
 UTS_MACHINE	:= s390x
 STACK_SIZE	:= 16384
 CHECKFLAGS	+= -D__s390__ -D__s390x__
diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index fc0dcf1..eaee146 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -26,7 +26,6 @@ UTS_MACHINE    := sparc
 
 KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
 KBUILD_AFLAGS  += -m32 -Wa,-Av8
-UAPICFLAGS     += -m32
 
 else
 #####
@@ -43,7 +42,6 @@ KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
 KBUILD_CFLAGS += -Wa,--undeclared-regs
 KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
 KBUILD_AFLAGS += -m64 -mcpu=ultrasparc -Wa,--undeclared-regs
-UAPICFLAGS    += -m64
 
 ifeq ($(CONFIG_MCOUNT),y)
   KBUILD_CFLAGS += -pg
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index add7271..c1aa368 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -47,7 +47,6 @@ ifeq ($(CONFIG_X86_32),y)
         biarch := $(call cc-option,-m32)
         KBUILD_AFLAGS += $(biarch)
         KBUILD_CFLAGS += $(biarch)
-        UAPICFLAGS    += $(biarch)
 
         KBUILD_CFLAGS += -msoft-float -mregparm=3 -freg-struct-return
 
@@ -80,7 +79,6 @@ else
         biarch := -m64
         KBUILD_AFLAGS += -m64
         KBUILD_CFLAGS += -m64
-        UAPICFLAGS    += -m64
 
         # Don't autogenerate traditional x87, MMX or SSE instructions
         KBUILD_CFLAGS += -mno-mmx -mno-sse
diff --git a/scripts/Makefile.uapiprogs b/scripts/Makefile.uapiprogs
index 63c09d0..c88a0cc 100644
--- a/scripts/Makefile.uapiprogs
+++ b/scripts/Makefile.uapiprogs
@@ -29,8 +29,7 @@ uapi-cmulti  := $(addprefix $(obj)/,$(uapi-cmulti))
 uapi-cobjs   := $(addprefix $(obj)/,$(uapi-cobjs))
 
 # Options to uapicc.
-uapic_flags = -Wp,-MD,$(depfile) -isystem $(INSTALL_HDR_PATH)/include \
-              $(UAPICFLAGS) -Wall
+uapic_flags = -Wp,-MD,$(depfile) -isystem usr/host/include $(HOSTCFLAGS)
 
 #####
 # Compile uapi programs on the build host
@@ -38,21 +37,21 @@ uapic_flags = -Wp,-MD,$(depfile) -isystem $(INSTALL_HDR_PATH)/include \
 # Create executable from a single .c file
 # uapi-csingle -> executable
 quiet_cmd_uapi-csingle = UAPICC  $@
-      cmd_uapi-csingle = $(CC) $(uapic_flags) -o $@ $<
+      cmd_uapi-csingle = $(HOSTCC) $(uapic_flags) -o $@ $<
 $(uapi-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,uapi-csingle)
 
 # Create .o file from a single .c file
 # uapi-cobjs -> .o
 quiet_cmd_uapi-cobjs	= UAPICC  $@
-      cmd_uapi-cobjs	= $(CC) $(uapic_flags) -c -o $@ $<
+      cmd_uapi-cobjs	= $(HOSTCC) $(uapic_flags) -c -o $@ $<
 $(uapi-cobjs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,uapi-cobjs)
 
 # Link an executable based on list of .o files
 # uapi-cmulti -> executable
 quiet_cmd_uapi-cmulti	= UAPILD  $@
-      cmd_uapi-cmulti	= $(CC) -o $@ \
+      cmd_uapi-cmulti	= $(HOSTCC) -o $@ \
 			  $(addprefix $(obj)/,$($(@F)-y))
 $(uapi-cmulti): $(obj)/%: $(uapi-cobjs) FORCE
 	$(call if_changed,uapi-cmulti)
