Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from goliath.siemens.de ([192.35.17.28]:35433 "EHLO
	goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754312AbcGVMs0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Jul 2016 08:48:26 -0400
Date: Fri, 22 Jul 2016 14:48:19 +0200
From: Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH] builddeb: fix file permissions before packaging
Message-ID: <20160722144819.5a7841e8@md1em3qc>
In-Reply-To: <57920E64.2030502@suse.com>
References: <1467903037-11785-1-git-send-email-henning.schild@siemens.com>
	<57920E64.2030502@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Am Fri, 22 Jul 2016 14:15:32 +0200
schrieb Michal Marek <mmarek@suse.com>:

> On 2016-07-07 16:50, Henning Schild wrote:
> > Builddep is not very explicit about file permissions. Actually the
> > file permissions in the package are largely influenced by the umask
> > of the user cloning the git and building the package. If that umask
> > does not set go+r the resulting linux-headers package will prevent
> > non-root users from building out-of-tree modules. And that is
> > probably just one unexpected effect.
> > Being a packaging/install tool builddep should make sure the file
> > permissions are set correctly and not just derived from a value
> > that is never checked.
> > 
> > This patch derives the "r" and "x" bits for all files from the file
> > owner, all directories in the package will be 755.
> > 
> > Signed-off-by: Henning Schild <henning.schild@siemens.com>
> > ---
> >  scripts/package/builddeb | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index 86e56fe..615e0ed 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -26,6 +26,11 @@ create_package() {
> >  	# Fix ownership and permissions
> >  	chown -R root:root "$pdir"
> >  	chmod -R go-w "$pdir"
> > +	# in case we are in a restrictive umask environment like
> > 0077
> > +	# set permissions for dirs and derive "go"-"rx"
> > permissions from "u"
> > +	find $pdir -type d -exec chmod 0755 {} +
> > +	find $pdir -type f -perm -u+r -exec chmod go+r {} +
> > +	find $pdir -type f -perm -u+x -exec chmod go+x {} +  
> 
> This can be simplified as
> 
> chmod -R a+rX "$pdir"

That 'X' is much nicer than the finds, learned something new today,
Thanks!

Henning

> Michal

