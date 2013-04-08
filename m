Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50320 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934591Ab3DHKuP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Apr 2013 06:50:15 -0400
Message-ID: <5162A0E5.3050903@suse.cz>
Date: Mon, 08 Apr 2013 12:50:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: PROBLEM: CONFIG_DEFAULT_MESSAGE_LOGLEVEL option seems not to
 work
References: <20130315234307.2f2846c8@merope>
In-Reply-To: <20130315234307.2f2846c8@merope>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?TWFub2xvIETDrWF6?= <diaz.manolo@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 15.3.2013 23:43, Manolo Díaz wrote:
> Hi,
> 
> It seems that the kernel loglevel is set to 7 ignoring the
> CONFIG_DEFAULT_MESSAGE_LOGLEVEL option (set to 4 in my config file)
> 
> The /proc/sys/kernel/printk output is 
> 
> 7	4	1	7

The default message loglevel (loglevel for messages with no explicitly
defined priority) is the second number. The first number is the console
loglevel.

Michal
