Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:39911 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752689Ab0HPVuG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 17:50:06 -0400
Date: Mon, 16 Aug 2010 23:50:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC 0/2] Factor Kconfig's prefix and package name
Message-ID: <20100816215002.GA8711@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com> <20100816123642.GA7233@merkur.ravnborg.org> <AANLkTi=gODj4S0vWfa512sMM__MLhoZo9aU1y1pbN0gf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTi=gODj4S0vWfa512sMM__MLhoZo9aU1y1pbN0gf@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

> 
> > 3) Do not hardcode "CONFIG_"
> >  - I suggest to introduce a single define named "CONFIG_".
> >    All the places that hardcode the length should be
> >    replaced by strlen(CONFIG_).
> >  - The define should be conditional like this:
> > #if !defined(CONFIG_)
> > #define CONFIG_ "CONFIG_"
> > #endif
> >    In this way other users can just use -DCONFIG_=BR2_ as they prefer.
> >
> agreed. the only thing I am not really fond of is that "strlen(...)"
> is computed at runtime, whereas "sizeof(...)-1" is a build time
> constant, but this might not be that worth.

gcc will recognize that strlen("CONFIG_") is a constant
and will optimize out the call.

	Sam
