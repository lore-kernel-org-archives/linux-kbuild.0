Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:37685 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755864Ab3GKVCW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jul 2013 17:02:22 -0400
Date: Thu, 11 Jul 2013 23:02:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Kconfig Gtk/Qt interface flavours ported to newest toolkit
	versions
Message-ID: <20130711210220.GB29911@merkur.ravnborg.org>
References: <1372778550-22110-1-git-send-email-david.graeff@web.de> <20130703163038.GA3268@free.fr> <51D76127.9060209@tu-dortmund.de> <20130710213213.GF3297@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130710213213.GF3297@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David =?iso-8859-1?Q?Gr=E4ff?= <david.graeff@tu-dortmund.de>, linux-kbuild@vger.kernel.org

> 
> So as a summarry, here are the three options:
>   - update existing frontends against their respective framework
>   - add two new frontends, and two new goals to call them
>   - add two new frontends, and decide whether to call them or the old ones
> 
> Really, I have no idea what is best.

As per my other mail the best candidate is
"- update existing frontends against their respective framework".

Because:
- There exist a fallback for users that do not have the never libs available
- The gtk/qt frontends see only little love&care - so coming up with something
  that require more love&care is not good
- And we know that we have a person to look after the problems that is introduced
  at lest for a few months.

We should carefully review the patches to make sure the resulting code is maintainable
in the long term. I assume this is more or less a no-brainer.

	Sam
