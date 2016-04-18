Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0219.hostedemail.com ([216.40.44.219]:53565 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750860AbcDRVnf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2016 17:43:35 -0400
Date: Mon, 18 Apr 2016 17:43:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2] localmodconfig: Fix parsing of Kconfig "source"
 statements
Message-ID: <20160418174326.60d92201@gandalf.local.home>
In-Reply-To: <20160418202912.GA15025@f1.synalogic.ca>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
	<20160408142940.6de077d5@gandalf.local.home>
	<20160410235234.GA13689@f1.synalogic.ca>
	<20160418202912.GA15025@f1.synalogic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 18 Apr 2016 13:29:12 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> On 2016/04/10 16:52, Benjamin Poirier wrote:
> > On 2016/04/08 14:29, Steven Rostedt wrote:  
> > > On Sat,  2 Apr 2016 10:55:21 -0700
> > > Benjamin Poirier <bpoirier@suse.com> wrote:
> > >   
> > > > The parameter of Kconfig "source" statements does not need to be quoted.
> > > > The current regex causes many kconfig files to be skipped and hence,
> > > > dependencies to be missed.
> > > > 
> > > > Also fix the whitespace repeat count.
> > > > 
> > > > Signed-off-by: Benjamin Poirier <bpoirier@suse.com>  
> > > 
> > > Thanks for sending this. I'll apply it. Should this be marked for
> > > stable? And if so, how far back?  
> > 
> > The first problem dates back to the introduction of streamline_config.pl in
> > 	dcc6024 kconfig: add streamline_config.pl to scripts (v2.6.32-rc1)
> > The second problem started with
> > 	19e91b6 modsign: Allow external signing key to be specified (v4.3-rc1)
> > 
> > However, I'm not sure that adding the patch to stable is warranted. I
> > considered this with regards to the problem fixed by patch 1/2.
> > 
> > First, I searched for cases where dependency info that's currently missing
> > would lead to lead to symbols being erroneously deactivated but I did not find
> > any. Since these cases are not so obvious and are quite rare in general, it's
> > possible that I missed one but at this stage the problem is theoretical.
> > 
> > Second, even if there is such a case, I'm not sure that the problem is
> > "critical". streamline_config.pl may output an "invalid" config because
> > it misses some dependencies but the config will be fixed by the
> > invocation of silentoldconfig that comes right after in the
> > localmodconfig makefile rule. It might not be the config the user
> > wanted, but it will be valid.
> > 
> > However, while looking for such a case, I've noticed a few other issues in
> > streamline_config.pl and I'll send more patches shortly.  
> 
> Hi Steven,
> 
> Can you please merge these six patches (2 original + 4 followups)?
> 

OK, I've marked them as todo. I've just come back from two weeks of
conferences and I'm working on catching up.

-- Steve

