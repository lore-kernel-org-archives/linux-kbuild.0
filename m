Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ud10.udmedia.de ([194.117.254.50]:44264 "EHLO
	mail.ud10.udmedia.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478Ab1KYIYL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Nov 2011 03:24:11 -0500
Date: Fri, 25 Nov 2011 09:24:08 +0100
From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: march=native target?
Message-ID: <20111125082408.GA1624@x4.trippels.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Wouldn't it be a good idea to add a "march=native" target to
Kconfig.cpu, so that a user doesn't have to select a specific processor
family and automatically gets the best support for his native
architecture?

(I'm asking because I use a AMD K10 processor and there is only a K8
target in kconfig. Changing k8 to native in arch/x86/Makefile produces
better code AFAICT by looking at the assembler output side by side)

-- 
Markus
