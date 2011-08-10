Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:40480 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752875Ab1HJRBc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Aug 2011 13:01:32 -0400
Date: Wed, 10 Aug 2011 10:01:30 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 2/2] Enable 'make CONFIG_FOO=y oldconfig'
Message-Id: <20110810100130.6adc6c99.rdunlap@xenotime.net>
In-Reply-To: <CACqU3MUJkM3Y2o2Jx1eQxZkW2T-Dby1JCaks6SqTz_FB17hSvw@mail.gmail.com>
References: <1312067499.22074.59.camel@i7.infradead.org>
	<1312067670.22074.61.camel@i7.infradead.org>
	<CACqU3MV460WGjmQdOOmhk3ZJT1FNjEjfuHqx8mYcgun9+7SfjA@mail.gmail.com>
	<4E34998D.8060806@zytor.com>
	<CACqU3MWn-OQVfLH96E+AeTCEjUw5+girXbuNgmUvXrEQuBe4vg@mail.gmail.com>
	<4E4140B3.7090802@suse.cz>
	<CACqU3MU4wJb3ij6skod-ZiM+Q0OMTXNdbJ+qWjJW8VZNEP+x1g@mail.gmail.com>
	<4E4280BA.9050109@suse.cz>
	<1312981658.2989.39.camel@i7.infradead.org>
	<CACqU3MUJkM3Y2o2Jx1eQxZkW2T-Dby1JCaks6SqTz_FB17hSvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.cz>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, 10 Aug 2011 10:15:55 -0400 Arnaud Lacombe wrote:

> Btw, warning about potential missing dependencies are useless[0],
> user, even kernel hacker do _not_ read them. We spent a few day
> tracking down a build failure on powerpc triggered because SND_ISA was
> selected without ISA_DMA_API, a warning was present, but nobody cared
> about it.

That one was an anomaly.  I usually see them and often send patches
for them.  But granted, most developers just pass over them.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
