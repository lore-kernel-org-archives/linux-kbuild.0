Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:34007 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755546Ab1CISAi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Mar 2011 13:00:38 -0500
Date: Wed, 9 Mar 2011 19:00:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: problem with ccflags := -Werror in Makefiles when building
	with gcc 4.6.0
Message-ID: <20110309180037.GA29233@merkur.ravnborg.org>
References: <AANLkTi=3xRFt-p+HUMWwTUcUzFaxY6y9bovJiqdHTwrn@mail.gmail.com> <1299691370.20104.127.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1299691370.20104.127.camel@Joe-Laptop>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Douglas Mencken <dougmencken@gmail.com>, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Michal Marek <mmarek@suse.cz>, Ingo Molnar <mingo@elte.hu>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Mar 09, 2011 at 09:22:50AM -0800, Joe Perches wrote:
> On Wed, 2011-03-09 at 17:28 +0100, Douglas Mencken wrote:
> > When building with gcc 4.6.0 with the new type of warnings introduced,
> > -Wunused-but-set-variable, many directories with ccflags set to
> > -Werror in Makefile fail to build.
> 
> After the kbuild W=<level> gets accepted,
> it might be reasonable to add another W
> level to make warnings fatal and remove
> all -Werror entries from the various Makefiles.

It does not make sense to remove -Werror.
They are there by default.

It is just plain wrong to go removing -Werror that has been there for ages.
Either we fix the warnings or we tell gcc to shut up.

	Sam
