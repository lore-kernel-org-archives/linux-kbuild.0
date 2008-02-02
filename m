Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:60010 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1764204AbYBBUql (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:41 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] Create arch/Kconfig
Date: Sat,  2 Feb 2008 21:46:41 +0100
Message-Id: <1201985204-26589-7-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

Puts the content of arch/Kconfig in the "General setup" menu.

Linus:

> Should it come with a re-duplication of it's content into each
> architecture, which was the case previously ? The oprofile and kprobes
> menu entries were litteraly cut and pasted from one architecture to
> another. Should we put its content in init/Kconfig then ?

I don't think it's a good idea to go back to making it per-architecture,
although that extensive "depends on <list-of-archiectures-here>" might
indicate that there certainly is room for cleanup there.

And I don't think it's wrong keeping it in kernel/Kconfig.xyz per se, I
just think it's wrong to (a) lump the code together when it really doesn't
necessarily need to and (b) show it to users as some kind of choice that
is tied together (whether it then has common code or not).

On the per-architecture side, I do think it would be better to *not* have
internal architecture knowledge in a generic file, and as such a line like

        depends on X86_32 || IA64 || PPC || S390 || SPARC64 || X86_64 || AVR32

really shouldn't exist in a file like kernel/Kconfig.instrumentation.

It would be much better to do

        depends on ARCH_SUPPORTS_KPROBES

in that generic file, and then architectures that do support it would just
have a

        bool ARCH_SUPPORTS_KPROBES
                default y

in *their* architecture files. That would seem to be much more logical,
and is readable both for arch maintainers *and* for people who have no
clue - and don't care - about which architecture is supposed to support
which interface...

Sam Ravnborg:

Stuff it into a new file: arch/Kconfig
We can then extend this file to include all the 'trailing'
Kconfig things that are anyway equal for all ARCHs.

But it should be kept clean - so if we introduce such a file
then we should use ARCH_HAS_whatever in the arch specific Kconfig
files to enable stuff that is not shared.

[...]

The above suggestion is actually not exactly the best way to do it...
First the naming..
A quick grep shows following usage today (in Kconfig files)
ARCH_HAS        51
ARCH_SUPPORTS   4
HAVE_ARCH       7

ARCH_HAS is the clear winner.

In the common Kconfig file do:

config FOO
        depends on ARCH_HAS_FOO
        bool "bla bla"

config ARCH_HAS_FOO
        def_bool n

In the arch specific Kconfig file in a suitable place do:

config SUITABLE_OPTION
        select ARCH_HAS_FOO

The naming of ARCH_HAS_ is fixed and shall be:
ARCH_HAS_<config option it will enable>

Only a single line added pr. architecture.
And we will end up with a (maybe even commented) list of trivial selects.

- Yet another update :

Moving to HAVE_* now.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/Kconfig |    3 +++
 init/Kconfig |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 arch/Kconfig

diff --git a/arch/Kconfig b/arch/Kconfig
new file mode 100644
index 0000000..2491714
--- /dev/null
+++ b/arch/Kconfig
@@ -0,0 +1,3 @@
+#
+# General architecture dependent options
+#
diff --git a/init/Kconfig b/init/Kconfig
index dcc96a8..8de6c48 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -665,6 +665,8 @@ config SLOB
 
 endchoice
 
+source "arch/Kconfig"
+
 endmenu		# General setup
 
 config SLABINFO
-- 
1.5.4.rc3.14.g44397

