Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:51598 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755951Ab2DKBd0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Apr 2012 21:33:26 -0400
Date: Tue, 10 Apr 2012 20:33:18 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Message-ID: <20120411013318.GD11506@burratino>
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
 <201204091802.29839.yann.morin.1998@free.fr>
 <20120410135753.GB2444@burratino>
 <201204110107.01273.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201204110107.01273.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Yann E. MORIN wrote:

> The scenario involves an upper-layer build system that:
>   - is responsible for settings the kernel options based on global
>     configuration (eg. the same kernel build for different boards)
>     and/or options set by users (eg. I want USB camera support)
>   - uses scripts/config to set/unset options rather than implementing
>     its own logic
>   - in this case the version string can be set to include the user's
>     name, which may contain double-quotes (eg. John "Ripper" Smith)

Thanks for explaining.  That makes sense.

I agree that it doesn't sound like enough of a show-stopper to warrant
inclusion in -stable.  This build system UI bug has existed since
v2.6.31-rc1~335^2~1 (kbuild: add generic --set-str option to
scripts/config, 2009-05-25).
