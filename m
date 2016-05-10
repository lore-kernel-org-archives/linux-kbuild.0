Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53482 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753160AbcEJPVP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 11:21:15 -0400
Date: Tue, 10 May 2016 17:21:14 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH v2] kconfig: add unexpected data itself to warning
Message-ID: <20160510152114.GA13314@pobox.suse.cz>
References: <1458160047-8292-1-git-send-email-pebolle@tiscali.nl> <1461784817.21886.5.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461784817.21886.5.camel@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 27, 2016 at 09:20:17PM +0200, Paul Bolle wrote:
> Hi Michal,
> 
> On wo, 2016-03-16 at 21:27 +0100, Paul Bolle wrote:
> > If the .config parser runs into unexpected data it emits warnings
> > like:
> >     .config:6911:warning: unexpected data
> > 
> > Add the unexpected data itself to this warning. That makes it easier to
> > discover what is actually going wrong:
> >      .config:6911:warning: unexpected data: CONFOG_CHARGER_TPS65217=m
> > 
> > Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> > ---
> > This v2 uses strcspn, as Michal suggesed. That turns a two patch series into a
> > more elegant oneliner. It apparently pays off to know what string.h has to
> > offer!
> 
> Nothing happened after I sent v2, as far as I can tell. Did this
> oneliner fall through the cracks? 

The kbuild maintainer has fallen through cracks for a while ;). Applied
to kbuild.git#kconfig now.

Michal
