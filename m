Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:61450 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757351Ab2DIPaL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Apr 2012 11:30:11 -0400
Received: by dake40 with SMTP id e40so5403823dak.11
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Apr 2012 08:30:10 -0700 (PDT)
Date: Mon, 9 Apr 2012 08:30:06 -0700
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Message-ID: <20120409153006.GA28221@kroah.com>
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

On Mon, Apr 09, 2012 at 02:49:10PM +0200, Yann E. MORIN wrote:
> Currently, scripts/config removes the leading double-quote from
> string options, but leaves the trailing double-quote.
> 
> Also, double-quotes in a string are escaped, but scripts/config
> does not unescape those when printing
> 
> Finally, scripts/config does not escape double-quotes when setting
> string options.
> 
> Eg. the current behavior:
>     $ grep -E '^CONFIG_FOO=' .config
>     CONFIG_FOO="Bar \"Buz\" Meh"
>     $ ./scripts/config -s FOO
>     Bar \"Buz\" Meh"
>     $ ./scripts/config --set-str FOO 'Alpha "Bravo" Charlie'
>     $ grep -E '^CONFIG_FOO=' .config
>     CONFIG_FOO="Alpha "Bravo" Charlie"
> 
> Fix those three, giving this new behavior:
>     $ grep -E '^CONFIG_FOO=' .config
>     CONFIG_FOO="Bar \"Buz\" Meh"
>     $ ./scripts/config -s FOO
>     Bar "Buz" Meh
>     $ ./scripts/config --set-str FOO 'Alpha "Bravo" Charlie'
>     $ grep -E '^CONFIG_FOO=' .config
>     CONFIG_FOO="Alpha \"Bravo\" Charlie"
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: stable@vger.kernel.org

How does this fit the Documentation/stable_kernel_rules.txt
qualification for a patch to be added to the stable releases?

greg k-h
