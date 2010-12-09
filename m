Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:61343 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859Ab0LIQHF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Dec 2010 11:07:05 -0500
Received: by yxt3 with SMTP id 3so1452611yxt.19
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Dec 2010 08:07:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikrnC4mbFN31Ct90St7f7Hv0a0Z4TR6qPs+4w-t@mail.gmail.com>
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
	<AANLkTikrnC4mbFN31Ct90St7f7Hv0a0Z4TR6qPs+4w-t@mail.gmail.com>
Date: Thu, 9 Dec 2010 11:07:04 -0500
Message-ID: <AANLkTi=vnF-3JoBN+PYGXAXN2SDBocbLUQMRV2kPNo5U@mail.gmail.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu attribute
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org, mchehab@redhat.com, Michal Marek <mmarek@suse.cz>

Hi,

On Thu, Dec 9, 2010 at 10:58 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
[..]
> I'm not either a big fan of testing `menu->visibility' truth, it is an
> expression which should be expended by the proper expr_* accessor to
> have less things to fix later.
>
gniarf, forget about that paragraph, I'm not fully awaken :/

What I thought about was the case where the visible property would
explicitly default to 'y' in which case the expression will have to be
simplified/manipulated, in that case, menu_finalize() will be the
place to do that, so this come back to my first comment.

 - Arnaud
