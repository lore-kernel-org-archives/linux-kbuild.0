Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from p-mail1.rd.orange.com ([195.101.245.15]:25208 "EHLO
	p-mail1.rd.orange.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752743Ab3JBHFV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 03:05:21 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 4/4] kconfig: remove unused definition from scanner
Date: Wed, 2 Oct 2013 08:57:54 +0200
References: <6249343.9Mjtul3lu5@tacticalops> <ghk3hwjhqk.fsf@lena.gouders.net>
In-Reply-To: <ghk3hwjhqk.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201310020857.54800.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Martin Walch <walch.martin@web.de>, Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, Arve =?iso-8859-1?q?Hj=F8nnev=E5g?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, Alan Cox <alan@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Martin, All,

On Wednesday 02 October 2013 08:42:59 Dirk Gouders wrote:
> Martin Walch <walch.martin@web.de> writes:
> 
> > From: Martin Walch <walch.martin@web.de>
> > Date: Wed, 2 Oct 2013 06:58:46 +0200
> > Subject: [PATCH 4/4] kconfig: remove unused definition from scanner
> >
> > The definition ws [ \n\t] is not used anywhere. Drop it to avoid confusion.
> 
> Hi Martin,
> 
> I think you should also regenerate the scanner and add
> the new zconf.lex.c_shipped to this patch.

I think sending the re-generated parser as a separate patch helps
in reviewing. Ie. I'd prefer a fifth patch.

BTW, regenerating the parser can be done with:
    make REGENERATE_PARSERS=1 config

Regards,
Yann E. MORIN.

> > Signed-off-by: Martin Walch <walch.martin@web.de>
> > ---
> >  scripts/kconfig/zconf.l | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> > index 6555a47..1a9f53e 100644
> > --- a/scripts/kconfig/zconf.l
> > +++ b/scripts/kconfig/zconf.l
> > @@ -68,7 +68,6 @@ static void alloc_string(const char *str, int size)
> >  }
> >  %}
> >  
> > -ws	[ \n\t]
> >  n	[A-Za-z0-9_]
> >  
> >  %%
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
