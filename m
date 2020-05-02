Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727862AbgEBNk1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 09:40:27 -0400
Date: Sat, 2 May 2020 09:40:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200502094024.6142a04e@oasis.local.home>
In-Reply-To: <20200502133054.gx77eoas7u7gnxxm@mail.google.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
        <20200501130729.3a3e4994@gandalf.local.home>
        <20200502133054.gx77eoas7u7gnxxm@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sat, 2 May 2020 21:30:54 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> > > Sometimes it is useful to preserve batches of configs when making
> > > localmodconfig. For example, I usually don't want any usb and fs
> > > modules to be disabled. Now we can do it by:
> > > 
> > >  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig  
> > 
> > That's too much typing ;-) What about just "KEEP='drivers/usb;fs'"?
> >  
> I think we'd better use a long name since it will be passed to the entire kbuild.
> And we alreay have one named LOCALMODCONFIG_DEBUG. The prefix LOCALMODCONFIG_
> can help to avoid namespace pollution.

I politely disagree. Build options is not common. The
LOCALMODCONFIG_DEBUG is an environment variable, which I couldn't just
use DEBUG.

If you absolutely require a prefix, shorten it to LMC_ or something. I
already hate typing 'localmodconfig' once ;-)

-- Steve
