Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:57443 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757419Ab1EBQQQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2011 12:16:16 -0400
MIME-Version: 1.0
In-Reply-To: <1304083893-18849-1-git-send-email-mmarek@suse.cz>
References: <71633.1304013549@localhost>
	<1304083893-18849-1-git-send-email-mmarek@suse.cz>
Date: Tue, 3 May 2011 00:16:15 +0800
Message-ID: <BANLkTikMf4x0e3UhabUH+c_xnWJMQ3rkvg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Allow to combine multiple W= levels
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Valdis.Kletnieks@vt.edu, bp@alien8.de, sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davej@redhat.com

On Fri, Apr 29, 2011 at 9:31 PM, Michal Marek <mmarek@suse.cz> wrote:
> Add support for make W=12, make W=123 and so on, to enable warnings from
> multiple W= levels. Normally, make W=<level> does not include warnings
> from the previous level.
>

This interface is not friendly, at least not as normal as we often see.
W=x+1 is supposed to include warnings of W=x.

Please refine the interface.

Thanks.
