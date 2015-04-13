Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:35466 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751020AbbDMVzJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 17:55:09 -0400
Date: Mon, 13 Apr 2015 14:55:08 -0700
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
Message-ID: <20150413215508.GW15335@tassilo.jf.intel.com>
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
 <20150413153212.131fabc1@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150413153212.131fabc1@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

> Interesting. But I can't accept this until I can test it. I don't have

AFAIK that's a unique policy. I don't think any other maintainer operates
this way.

> I wonder who's responsible for
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/
> 
> If they can add a i386/x86_64 build for gcc5 I'll be happy to download
> it and test this patch.

That doesn't make any sense.

-Andi
