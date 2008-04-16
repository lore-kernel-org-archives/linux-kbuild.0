Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:57266 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751378AbYDPTbU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Apr 2008 15:31:20 -0400
Date: Wed, 16 Apr 2008 21:31:02 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: 2.6.25 and DEBUG_SECTION_MISMATCH
Message-ID: <20080416193102.GA16981@elte.hu>
References: <20080416175135.GN1677@cs181133002.pp.htv.fi> <20080416192306.GA3090@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080416192306.GA3090@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


* Sam Ravnborg <sam@ravnborg.org> wrote:

> I would prefer we were down to less than 5 warnings so we could enable 
> it in kconfig but maybe after next merge window.

they get regenerated. More than 1 out of every 100 new patches. Quite 
expensive feature (in terms of maintenance overhead) for a rather 
theoretical memory saving benefit.

	Ingo
