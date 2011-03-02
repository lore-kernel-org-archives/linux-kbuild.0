Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:38899 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757667Ab1CBVLs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2011 16:11:48 -0500
Received: by wyg36 with SMTP id 36so437257wyg.19
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Mar 2011 13:11:46 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 2 Mar 2011 22:11:46 +0100
Message-ID: <AANLkTi=vPJ_TacWUswaS9Zc-2ji0Wn5GhF2M+EKExoME@mail.gmail.com>
Subject: KBuild question
From: Tom Bart <tbartcz@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,
I have spend some time analysing KBuild source files. However there is
one thing that is not clear for me. In the main makefile I have found
the following statement:

Most importantly: sub-Makefiles should only ever modify files in
their own directory. If in some directory we have a dependency on
a file in another dir (which doesn't happen often, but it's often
unavoidable when linking the built-in.o targets which finally
turn into vmlinux), we will call a sub make in that other dir, and
after that we are sure that everything which is in that other dir
is now up to date.

Kernel is build in a recursive manner. I understand that according to
the citation firstly all dependencies between different directories
are identified and then the sub-directory walk through process is
started. Unfortunately I cannot fine where this functionality is
implemented? Can somebody point me the right place or maybe my line of
reasoning is simply wrong?
Regards
Tomasz Bartczak
