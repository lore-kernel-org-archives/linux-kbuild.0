Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgEBObL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 10:31:11 -0400
Date: Sat, 2 May 2020 14:31:08 +0000
From: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200502143106.7cpbots6oriib26v@mail.google.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
 <20200501130729.3a3e4994@gandalf.local.home>
 <20200502133054.gx77eoas7u7gnxxm@mail.google.com>
 <20200502094024.6142a04e@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502094024.6142a04e@oasis.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hi, Steven,
On Sat, May 02, 2020 at 09:40:24AM -0400, Steven Rostedt wrote:
> On Sat, 2 May 2020 21:30:54 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > > > Sometimes it is useful to preserve batches of configs when making
> > > > localmodconfig. For example, I usually don't want any usb and fs
> > > > modules to be disabled. Now we can do it by:
> > > > 
> > > >  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig  
> > > 
> > > That's too much typing ;-) What about just "KEEP='drivers/usb;fs'"?
> > >  
> > I think we'd better use a long name since it will be passed to the entire kbuild.
> > And we alreay have one named LOCALMODCONFIG_DEBUG. The prefix LOCALMODCONFIG_
> > can help to avoid namespace pollution.
> 
> I politely disagree. Build options is not common. The
> LOCALMODCONFIG_DEBUG is an environment variable, which I couldn't just
> use DEBUG.
> 
This is what I am worried about since LOCALMODCONFIG_PRESERVE also is an
environment variable. A short name possibly overwrite internal kbuild
variables.

> If you absolutely require a prefix, shorten it to LMC_ or something. I
> already hate typing 'localmodconfig' once ;-)
> 
I undstand your pain. This why I never type 'localmodconfig' but copy it
from 'make help' :). Maybe we can get more inputs from others.

> -- Steve

-- 
Cheers,
Changbin Du
