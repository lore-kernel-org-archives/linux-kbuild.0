Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38078 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgBDQ3U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Feb 2020 11:29:20 -0500
From: Arvind Sankar <nivedita@alum.mit.edu>
Date: Tue, 4 Feb 2020 11:29:17 -0500
Subject: Re: [PATCH] initramfs: don't double-compress built-in initramfs if
 the kernel is compressed
Message-ID: <20200204162917.GA1772390@rani.riverdale.lan>
References: <20200203200656.GA455151@rani.riverdale.lan>
 <20200203211644.39847-1-nivedita@alum.mit.edu>
 <CAK7LNAQq7ah1yLOr-fgH-Oo7_NHzvYiy6huY1=4DxJoCGi+cmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQq7ah1yLOr-fgH-Oo7_NHzvYiy6huY1=4DxJoCGi+cmw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arvind Sankar <nivedita@alum.mit.edu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Tue, Feb 04, 2020 at 11:22:19AM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Feb 4, 2020 at 6:16 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > If the kernel is going to be compressed anyway, there is no point in
> > double-compressing the built-in initramfs. Hide the built-in initramfs
> > compression choice in this case.
> >
> > Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
> 
> 
> Double-compression slightly reduces the data size.
> And, keeping the bare vmlinux small is beneficial, IMHO.
> 

Ok. In my setup (kernel is compressed by xz), none for the builtin
initramfs is optimal by a measurable amount, but I that will depend on
config/initramfs contents/compression methods, so might well not be true
in general. Maybe add a note to the help text?

none    7030816 arch/x86/boot/bzImage
gz      7382144 arch/x86/boot/bzImage
bz2     7353696 arch/x86/boot/bzImage
lzma    7118176 arch/x86/boot/bzImage
xz      7126400 arch/x86/boot/bzImage
lzo     7379360 arch/x86/boot/bzImage
lz4     7335712 arch/x86/boot/bzImage


diff --git a/usr/Kconfig b/usr/Kconfig
index a6b68503d177..b68910b225fc 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -125,6 +125,12 @@ choice
 	  low on RAM, since it reduces the memory consumption during
 	  boot.
 
+	  Note that if the kernel itself is compressed, the builtin initramfs
+	  will be compressed twice, first by the algorithm selected here, and
+	  then by the kernel compression method chosen. This may increase the
+	  final image size, so you should test whether compressing the builtin
+	  initramfs provides any savings.
+
 	  Keep in mind that your build system needs to provide the appropriate
 	  compression tool to compress the generated initram cpio file for
 	  embedding.
