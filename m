Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:48733 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932447AbaFKQUT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 12:20:19 -0400
Received: by mail-pa0-f45.google.com with SMTP id hz1so2082804pad.32
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jun 2014 09:20:18 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH 0/2] x86,vdso,kbuild: Fix vdso_install
Date: Wed, 11 Jun 2014 09:20:05 -0700
Message-Id: <cover.1402503408.git.luto@amacapital.net>
In-Reply-To: <5398749B.4090209@zytor.com>
References: <5398749B.4090209@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, Josh Boyer <jwboyer@fedoraproject.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>

This changes kbuild slightly because I didn't want to fight with using
static pattern rules and extra obfuscated fake targets just to write a
loop.

Better ideas / cleanups welcome.

Andy Lutomirski (2):
  kbuild: Add recipe-cmd, an @-less cmd variant
  x86,vdso: Fix vdso_install

 arch/x86/vdso/Makefile | 20 +++++++-------------
 scripts/Kbuild.include |  1 +
 2 files changed, 8 insertions(+), 13 deletions(-)

-- 
1.9.3

