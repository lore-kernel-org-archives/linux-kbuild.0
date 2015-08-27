Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:33025 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952AbbH0JpB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Aug 2015 05:45:01 -0400
Received: by lbbsx3 with SMTP id sx3so7875511lbb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Aug 2015 02:44:59 -0700 (PDT)
Received: from morgan.rasmusvillemoes.dk ([130.225.20.51])
        by smtp.gmail.com with ESMTPSA id le5sm433776lab.29.2015.08.27.02.44.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 27 Aug 2015 02:44:58 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: file names embedded in kernel image
Date: Thu, 27 Aug 2015 11:44:57 +0200
Message-ID: <87wpwhhxpi.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi

I just noticed that when one build the kernel outside the source tree,
all __FILE__ occurences get replaced with the absolute path (since
that's what is given to gcc, and most -I paths are also absolute). This
ends up wasting quite a lot of space in .rodata, and I suppose most
distro supplied kernels have this issue. For example, my ubuntu kernel
is full of strings like

/build/linux-hFNI9K/linux-3.13.0/arch/x86/platform/sfi/sfi.c
/build/linux-hFNI9K/linux-3.13.0/kernel/fork.c

The /build/linux-hFNI9K/linux-3.13.0/ prefixes add up (and since it's an
artifact of the build process, wouldn't add any value in a bug-report
which one wouldn't also get from uname -a).

Distros could avoid this by building in-tree (maybe some already do) but
I was wondering if we could do something upstream.

Rasmus
