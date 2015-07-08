Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59639 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755378AbbGHU52 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 16:57:28 -0400
Date: Wed, 8 Jul 2015 17:57:23 -0300
From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH] tools/lib: improve clean target
Message-ID: <20150708205723.GA2656@redhat.com>
References: <1434631938-12681-1-git-send-email-riku.voipio@linaro.org>
 <CAAqcGHnT5kCapivn+mTZws2gJX0gwnLA2owzdguZsefsAdQ1fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAqcGHnT5kCapivn+mTZws2gJX0gwnLA2owzdguZsefsAdQ1fg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org, mingo@redhat.com, a.p.zijlstra@chello.nl, acme@kernel.org

Em Wed, Jul 08, 2015 at 09:22:23PM +0300, Riku Voipio escreveu:
> On 18 June 2015 at 15:52,  <riku.voipio@linaro.org> wrote:
> > From: Riku Voipio <riku.voipio@linaro.org>
> >
> > The clean targets miss some .cmd and .d files.
> 
> Is this patch slipping through cracks?

Not anymore, applied to my perf/urgent branch, will go soon to Ingo,
piggybacking on some more urgent stuff.

- Arnaldo
