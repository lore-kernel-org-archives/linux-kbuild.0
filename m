Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alln-iport-4.cisco.com ([173.37.142.91]:18279 "EHLO
        alln-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbeK1C2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Nov 2018 21:28:39 -0500
Date: Tue, 27 Nov 2018 07:20:49 -0800
From: Daniel Walker <danielwa@cisco.com>
Subject: Re: hidden string Kconfig ?
Message-ID: <20181127152049.dm3o4dkdfcqtk63u@zorba>
References: <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
 <20181115000756.k2fsgzmswdbikpfb@zorba>
 <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
 <20181115004706.r6azcyjd2fhtktio@zorba>
 <3d1cc558-17bf-d2b4-4121-33fff0625e22@infradead.org>
 <CAK7LNASk2NrsWkQs-pFAKFLG1-aDm29SQJJg378Voifqb320bw@mail.gmail.com>
 <20181115132516.o5eiomuhk4tq5cmr@zorba>
 <CAFkk2KRS0+7moW9VKjrBaNuXCVkowrQGymGcAFeNz64Yq6hUCg@mail.gmail.com>
 <20181115170020.wrhgzoxswlycw42i@zorba>
 <CAFkk2KQHW8hQyUR6L8UhWG8T6AaQpnR7hCHcscdbtd9AmJqWjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFkk2KQHW8hQyUR6L8UhWG8T6AaQpnR7hCHcscdbtd9AmJqWjA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 15, 2018 at 07:44:53PM +0100, Ulf Magnusson wrote:
> I'd go for the more manual version though. I wonder if this is
> significant/common enough to warrant a Kconfig feature, and it can be
> handled in other ways.


Here is something I came up with a couple weeks ago. It greps the config fo=
r an
option, then if it exists it will print something. I added coloring to allo=
w me
to make the message red. I could formalize this more, and it might be usefu=
l for
other message people may want to print.


diff --git a/init/Kconfig b/init/Kconfig
index b59e856511e1..70fad5e142e5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1842,6 +1842,14 @@ config CMDLINE_OVERRIDE
 	  This is used to work around broken boot loaders.  This should
 	  be set to 'N' under normal conditions.
=20
+# If you have the old style CONFIG_CMDLINE inside your config you will los=
e these options
+# This serves as a warning to let you know that you are losing these optio=
ns.
+m1 :=3D =0C=0DYou appear to have the legacy option CONFIG_CMDLINE in your =
config.=0C=0D
+m2 :=3D Be aware this option will be removed, and you will lose the conten=
ts=0C=0D
+m3 :=3D unless you move to the new CONFIG_CMDLINE_PREPEND, CONFIG_CMDLINE_=
APPEND=0C=0D
+m4 :=3D options.=0C=0D
+$(warning-if,$(success, grep -e "CONFIG_CMDLINE=3D\".\+\"" $(PWD)/$(O)/$(K=
CONFIG_CONFIG)), $(red, $(m1)$(m2)$(m3)$(m4)))
+
 endif
=20
 endmenu		# General setup
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index dad5583451af..7de7505388b7 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -28,3 +28,22 @@ ld-option =3D $(success,$(LD) -v $(1))
=20
 # gcc version including patch level
 gcc-version :=3D $(shell,$(srctree)/scripts/gcc-version.sh -p $(CC) | sed =
's/^0*//')
+
+# Color sequences
+red        =3D =1B[31m$(1)=1B[0m
+black      =3D =1B[30m$(1)=1B[0m
+green      =3D =1B[32m$(1)=1B[0m
+yellow     =3D =1B[33m$(1)=1B[0m
+blue       =3D =1B[34m$(1)=1B[0m
+magenta    =3D =1B[35m$(1)=1B[0m
+cyan       =3D =1B[36m$(1)=1B[0m
+white      =3D =1B[37m$(1)=1B[0m
+default    =3D =1B[39m$(1)=1B[0m
+
+# Text properties
+bold        =3D =1B[1m$(1)=1B[0m
+#bold 		=3D =1B[1m$(1)=1B[0m
+underlined 	=3D =1B[4m$(1)=1B[0m
+blinking 	=3D =1B[5m$(1)=1B[0m
+reset 		=3D =1B[0m$(1)=1B[0m
+
