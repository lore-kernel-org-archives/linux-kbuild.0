Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:48432 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755029Ab1ALRdw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 Jan 2011 12:33:52 -0500
Received: by bwz15 with SMTP id 15so733043bwz.19
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jan 2011 09:33:51 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 12 Jan 2011 18:33:50 +0100
Message-ID: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
Subject: Building an external x86_64 module from an x86 (32-bit) machine?
From: Philippe Auphelle <pauphelle@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Running a 2.6.35 kernel, and gcc 4.4.5, I'm trying to build both an
x86 (32) and an x86_64 external (out of tree) module from my x86
(32-bit) dev machine.

I have tried various tricks, such as using ARCH=X86_64 when running
make, but to no avail so far: Whatever I do, V=1 shows kbuild invoking
gcc with -m32 and ld with elf_i386.

I have googled around for a few hours without finding a solution to
the problem.
Since the x86 arch is unified and gcc is able to gen (and link) x86_64
targets, it looks like this could be done, and I must be missing
something.
Could anyone point me to the right direction?

TIA!

PhA.
