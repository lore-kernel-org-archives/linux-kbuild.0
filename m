Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:53908 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002Ab0EFDxy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 May 2010 23:53:54 -0400
Received: by pxi5 with SMTP id 5so1887585pxi.19
        for <linux-kbuild@vger.kernel.org>; Wed, 05 May 2010 20:53:53 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 6 May 2010 11:53:53 +0800
Message-ID: <u2l34f262ce1005052053z1cfe6d1an6c509e847ba4b40@mail.gmail.com>
Subject: One question about top-level Makefile.
From: os user <gnusercn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org

Hi, I have a question about the top-level Makefile

# The all: target is the default when no target is given on the
# command line.
# This allow a user to issue only 'make' to build a kernel including modules
# Defaults vmlinux but it is usually overridden in the arch makefile
all: vmlinux

From the last comment, arch makefile will override vmlinux. It seems
vmlinux will not be checked by `make'. But from my test, although
`all:' will be re-defined in arch Makefile (ARM arch), vmlinux will
still be checked and the commands associated will be executed. Should
we use another word instead of "overridden"?

Best  Regards
