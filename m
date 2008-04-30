Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.178]:63139 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756700AbYD3Kp6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2008 06:45:58 -0400
Received: by wa-out-1112.google.com with SMTP id j37so253395waf.23
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2008 03:45:57 -0700 (PDT)
Message-ID: <ed10ee420804300345r5d4566d2uff5c3f49f1c15107@mail.gmail.com>
Date: Wed, 30 Apr 2008 03:45:57 -0700
From: "SL Baur" <steve@xemacs.org>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
In-Reply-To: <20080429172402.14d7d40b@ephemeral>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080429183531.GB19652@uranus.ravnborg.org>
	 <20080429172402.14d7d40b@ephemeral>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>

On 4/29/08, Andres Salomon <dilinger@queued.net> wrote:
> On Tue, 29 Apr 2008 20:35:31 +0200
>  Sam Ravnborg <sam@ravnborg.org> wrote:

>  > And we add support for a new 'commandline' parameter
>  > 'K' so I can say:
>  >
>  > make K=/proc/config.gz defconfig
>  > make K=i386_defconfig  defconfig
>  > make K=i386_defconfig  oldconfig
>  > make K=/proc/config.gz newconfig
>  >
>  > So K is used to specify what config file we use
>  > to start out from.

I like this idea a lot.  I didn't like the hardcoded `.config' 13
years ago and I still
don't like it now.

>  Sounds good, I highly prefer specifying the config via env variable
>  rather than embedded in the target (ie, 'make olpc_defconfig').

Is there any reasonable way to embed the configuration file name in the kernel
image like BSD does it?  /proc/config.gz is a good way to retrieve way to
retrieve configuration information on a running system, not so good for pushing
kernels out to a network and keeping track of the config files on the build
machine.

I don't have any way of checking this now, but can /proc files like
/proc/config.gz
be exported via NFS or the equivalent?

-sb
