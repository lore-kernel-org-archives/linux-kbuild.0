Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:48750 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754171Ab0HHPhz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Aug 2010 11:37:55 -0400
Date: Sun, 8 Aug 2010 17:37:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] nconfig: add search support
Message-ID: <20100808153753.GA4205@merkur.ravnborg.org>
References: <1281275406-27540-1-git-send-email-nir.tzachar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1281275406-27540-1-git-send-email-nir.tzachar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nir.tzachar@gmail.com
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, randy.dunlap@oracle.com

On Sun, Aug 08, 2010 at 04:50:06PM +0300, nir.tzachar@gmail.com wrote:
> From: Nir Tzachar <nir.tzachar@gmail.com>
> 
> Remove the old hotkeys feature, and replace it by an interactive string
> search.
> >From nconfig help:
> 
> Searching: pressing '/' triggers interactive search mode.
>            nconfig performs a case insensitive search for the string
>            in the menu prompts (no regex support).
>            Pressing the up/down keys highlights the previous/next
>            matching item. Backspace removes one character from the
>            match string. Pressing either '/' again or ESC exits
>            search mode. All other keys behave normally.
> 
> Miscellaneous other changes (including Rundy's and Justin's input).
> 
> Signed-off-by: Nir Tzachar <nir.tzachar@gmail.com>

I like this search mode much better than the hotkey stuff.
And with the new key assignments things works almost as I would expect.

I am not sure if I prefer "space" to bind to usual
function or that it can be used to enter a whitespace.

And getting rid of the capitalization was good!

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
