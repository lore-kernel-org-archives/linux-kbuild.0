Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:46534 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752081AbdJMSDR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2017 14:03:17 -0400
Received: by mail-pf0-f173.google.com with SMTP id p87so10987299pfj.3
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Oct 2017 11:03:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH] kbuild: Allow specifying some base host CFLAGS
Date: Fri, 13 Oct 2017 11:02:43 -0700
Message-Id: <20171013180243.25849-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: groeck@chromium.org, vapier@chromium.org, mka@chromium.org, dtor@chromium.org, u.kleine-koenig@pengutronix.de, Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Right now there is a way to add some CFLAGS that affect target builds,
but no way to add CFLAGS that affect host builds.  Let's add a way.
We'll document two environment variables: CFLAGS_HOST and
CXXFLAGS_HOST.

We'll document that these variables get appended to by the kernel to
make the final CFLAGS.  That means that, though the environment can
specify some flags, if there is a conflict the kernel can override and
win.  This works differently than KCFLAGS which is appended (and thus
can override) the kernel specified CFLAGS.

Why would I make KCFLAGS and CFLAGS_HOST work differently in this way?
My argument is that it's about expected usage.  Typically the build
system invoking the kernel has some idea about some basic CFLAGS that
it wants to use to build things for the host and things for the
target.  In general the build system would expect that its flags can
be overridden if necessary (perhaps we need to turn off a warning when
compiling a certain file, for instance).  So, all other things being
equal, the way I'm making CFLAGS_HOST is the way I'd expect things to
work.

So, if it's expected that the build system can pass in a base set of
flags, why didn't we make KCFLAGS work that way?  The short answer is:
when building for the target the kernel is just "special".  The build
system's "target" CFLAGS are likely intended for userspace programs
and likely make very little sense to use as a basis.  This was talked
about in the seminal commit 69ee0b352242 ("kbuild: do not pick up
CFLAGS from the environment").  Basically: if the build system REALLY
knows what it's doing then it can pass in flags that the kernel will
use, but otherwise it should butt out.  Presumably this build system
that really knows what it's doing knows better than the kernel so
KCFLAGS comes after the kernel's normal flags.

One last note: I chose to add new variables rather than just having
the build system try to pass HOSTCFLAGS in somehow (either through the
environment or the command line) to avoid weird interactions with
recursive invocations of make.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/kbuild/kbuild.txt | 12 ++++++++++++
 Makefile                        |  5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index ac2363ea05c5..70bf51c1b77d 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -54,6 +54,18 @@ LDFLAGS_vmlinux
 --------------------------------------------------
 Additional options passed to final link of vmlinux.
 
+CFLAGS_HOST
+-----------
+A base set of flags to pass when compiling C files for the host (not
+the target).  The kernel will append some of its own flags to this
+set when actually calling the compiler.
+
+CXXFLAGS_HOST
+-------------
+A base set of flags to pass when compiling C++ files for the host (not
+the target).  The kernel will append some of its own flags to this
+set when actually calling the compiler.
+
 KBUILD_VERBOSE
 --------------------------------------------------
 Set the kbuild verbosity. Can be assigned same values as "V=...".
diff --git a/Makefile b/Makefile
index 04c4191952e0..b5e9895b2a7f 100644
--- a/Makefile
+++ b/Makefile
@@ -359,9 +359,10 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
+HOSTCFLAGS   := $(CFLAGS_HOST) \
+		-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
-HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
+HOSTCXXFLAGS := $(CXXFLAGS_HOST) -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
 HOST_LOADLIBES := $(HOST_LFS_LIBS)
 
-- 
2.15.0.rc0.271.g36b669edcc-goog

