Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0151.hostedemail.com ([216.40.44.151]:39822 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753048AbcDZWer (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 18:34:47 -0400
Date: Tue, 26 Apr 2016 18:34:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] localmodconfig: Fix whitespace repeat count after
 "tristate"
Message-ID: <20160426183443.7ece49a9@gandalf.local.home>
In-Reply-To: <20160426213519.GA4812@f1.synalogic.ca>
References: <20160426185421.GB2979@f1.synalogic.ca>
	<1461696998-3953-1-git-send-email-bpoirier@suse.com>
	<20160426155132.3cdf9adf@gandalf.local.home>
	<20160426213519.GA4812@f1.synalogic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Apr 2016 14:35:19 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> Separate tristate and prompt statements are allowed and recognized by
> the kconfig parser. Although there are no such cases now, there used to
> be one: 0a57274
> You sure you want to remove it from the regexp?

Hmm, OK, I'll take your patch as is.

Thanks,

-- Steve
