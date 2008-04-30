Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.178]:65487 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1764217AbYD3Ucw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2008 16:32:52 -0400
Received: by wa-out-1112.google.com with SMTP id j37so536872waf.23
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2008 13:32:52 -0700 (PDT)
Message-ID: <ed10ee420804301332n5fb72f3jb9bdea03aa313fad@mail.gmail.com>
Date: Wed, 30 Apr 2008 13:32:52 -0700
From: "SL Baur" <steve@xemacs.org>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
In-Reply-To: <20080430080134.60346a12.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080429183531.GB19652@uranus.ravnborg.org>
	 <20080429172402.14d7d40b@ephemeral>
	 <ed10ee420804300345r5d4566d2uff5c3f49f1c15107@mail.gmail.com>
	 <20080430080134.60346a12.randy.dunlap@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Andres Salomon <dilinger@queued.net>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>

On 4/30/08, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> On Wed, 30 Apr 2008 03:45:57 -0700 SL Baur wrote:

>  > Is there any reasonable way to embed the configuration file name in the kernel
>  > image like BSD does it?  /proc/config.gz is a good way to retrieve way to
>  > retrieve configuration information on a running system, not so good for pushing
>  > kernels out to a network and keeping track of the config files on the build
>  > machine.
>
>
> I don't know how BSD does it, but CONFIG_IKCONFIG does embed the
>  config image in the kernel.  It can be extracted with
>  scripts/extract-ikconfig.

No, that's not what I meant.  Now that we have a means of specifying
a configuration file by name, it would be nice if the file name could,
for example, be appended to EXTRAVERSION.  That's all it would
take to duplicate the behavior I misdescribed.


Eg. `make K=HPxw4300.config ...' would have "-HPxw4300" appended
to EXTRAVERSION.  Maybe this doesn't make sense any more, but it
was once something I wanted very much.

-sb
