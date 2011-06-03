Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.128.26]:29230 "EHLO mgw-da02.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751314Ab1FCQmX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jun 2011 12:42:23 -0400
Subject: Re: [GIT] kbuild core updates
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
In-Reply-To: <20110524120337.GA29839@sepie.suse.cz>
References: <20110524120337.GA29839@sepie.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 19:37:31 +0300
Message-ID: <1307119051.3069.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, cernekee@gmail.com, davej@redhat.com, jamey@minilop.net, marcin.nowakowski.000@gmail.com, pefoley2@verizon.net, sam@ravnborg.org, wangxiaochen0@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2011-05-24 at 14:03 +0200, Michal Marek wrote:
> Dave Jones (1):
>       kbuild: Disable -Wunused-but-set-variable for gcc 4.6.0

I think this is not so good idea. It does point valid dead code cases
too, and it is useful. We should let it be enabled at least for a bit
longer time to let people fix more of these warnings.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

