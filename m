Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40403 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418Ab2GZMaT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Jul 2012 08:30:19 -0400
Date: Thu, 26 Jul 2012 14:30:17 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: kbuild: Document oldnoconfig to what it really does
Message-ID: <20120726123017.GD25512@sepie.suse.cz>
References: <1339802699.25903.47.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339802699.25903.47.camel@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Jun 15, 2012 at 07:24:59PM -0400, Steven Rostedt wrote:
> The make target 'oldnoconfig' is a misnomer. It doesn't set new symbols
> to 'n', but instead sets it to their default values.
> 
> Unfortunately, assuming that it actually did this, broke ktest in some
> of its tests. For example, the tests to create a minimum config and even
> a config bisect, depends on removing various configs and using
> oldnoconfig to get rid of other configs that may have depended on it.
> 
> But because some configs that it was trying to disable, were in fact
> default enabled, this caused those configs to re-enable and corrupt the
> test.
> 
> I thought about fixing oldnoconfig, but I'm afraid that people are
> already dependent on its current behavior. Instead, I'm just updating
> the documentation to state that it sets the new symbols to their default
> values and not to 'n'.
> 
> Ideally, this would be called, 'olddefconfig' and we have an
> 'oldnoconfig' that actually disables the new symbols. But it's useless
> for me now. If it changed, ktest would need to be consistent between
> each version, and that would be to difficult to detect. I'll handle this
> issue with ktest with other means.
> 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Applied to kbuild.git#kconfig, thanks.

Michal
