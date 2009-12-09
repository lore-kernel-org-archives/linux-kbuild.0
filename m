Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aa011msr.fastwebnet.it ([85.18.95.71]:58371 "EHLO
	aa011msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967104AbZLIBjf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2009 20:39:35 -0500
Subject: Re: [PATCH] make gconfig: fix the "(NEW)" string
From: Matteo Cortese <matteo_cortese@fastwebnet.it>
In-Reply-To: <20091204110228.2ce3345c.randy.dunlap@oracle.com>
References: <23753252.369201259951904278.JavaMail.defaultUser@defaultHost>
	 <20091204110228.2ce3345c.randy.dunlap@oracle.com>
Content-Type: text/plain
Date: Wed, 09 Dec 2009 02:40:46 +0100
Message-Id: <1260322846.2363.55.camel@stego.sauro.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/12/2009 11:02 -0800, Randy Dunlap wrote:

> Did you just notice that thru source code inspection or via testing of
> gconfig?

I noticed the problem with the following test case (with the patch NOT
applied). 

$ rm -f .config
$ make clean && make gconfig

Select File->Save to save a "clean" version of .config and exit.
Now let's target a specific option, e.g. CONFIG_MODULES, and check that
it is present, either set to 'y' or commented out (mine is set to 'y'):

$ grep 'CONFIG_MODULES' .config
CONFIG_MODULES=y
$ make gconfig

At this point I see that module support has the NEW flag, but it
shouldn't! Exit, then manually remove CONFIG_MODULES from the .config
file:

$ sed -i '/CONFIG_MODULES/d' .config
$ make clean && make gconfig

Now I see that module support is not flagged as NEW, but it should.

I concluded that the logic was inverted.
I looked up the string NEW in the source and found the piece of code
cited below. Then I tried and figured out what that code was supposed to
do, and thought that it made more sense that the NEW flag was added when
an option (sym) had not been assigned a value yet (!sym_has_value).
So I worked out this simple patch. I've been using it for some time, and
it works for me, I mean, if I try the above test case, it gives the
expected results.


> Well, for me, with just some random config file that has
> CONFIG_MODULES=y
> CONFIG_BLOCK=y
> 
> gconfig with this patch says:
> 
>   Enable loadable module support
>   Enable the block layer (NEW)
> 
> and gconfig without this patch says:
> 
>   Enable loadable module support (NEW)
>   Enable the block layer
> 
> 
> I'm confuzed.  Go figure.

Yes, it makes no sense. Unfortunately I have no experience with .config
files generated in any other way than written by the GTK configurator...

Please bear in mind that I'm not a kernel developer, I just recompile my
kernel when a new version is released. I usually copy my .config file
from the previous kernel directory and then use the "NEW" flag to tell
which options were added since my last compile and thus deserve my
attention.
---
Matteo

