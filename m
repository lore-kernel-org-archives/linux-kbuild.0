Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:38536 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781AbcBHULF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 15:11:05 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: kbuild: global makefile and spaces in path
References: <87lh8nfrx8.fsf@belgarion.home> <568D2927.2010106@suse.com>
	<87mvshdpjh.fsf@belgarion.home> <87si164zha.fsf@belgarion.home>
	<56B8F474.8090302@suse.com>
Date: Mon, 08 Feb 2016 21:10:59 +0100
In-Reply-To: <56B8F474.8090302@suse.com> (Michal Marek's message of "Mon, 8
	Feb 2016 21:03:00 +0100")
Message-ID: <87h9hj2ca4.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Michal Marek <mmarek@suse.com> writes:

>
> Hi Robert,
>
> sorry for the delay. We should also check for colons in path, because
> they break the build in a similar way.
Okay, no problem, I'm on it.

Cheers.

-- 
Robert
