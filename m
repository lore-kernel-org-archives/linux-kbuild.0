Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55302 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758796AbcCDVzg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 16:55:36 -0500
Subject: Re: [PATCH] kbuild/mkspec: clean boot loader configuration on rpm
 removal
References: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
 <56D6FAD3.3000208@stressinduktion.org>
 <CA+5PVA6hxOA89gTiz-t4oK7qB4ug63R1DkGVXZ0FcD8ArPqkrg@mail.gmail.com>
 <1456996191.4882.17.camel@redhat.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56DA0454.5050900@suse.com>
Date: Fri, 4 Mar 2016 22:55:32 +0100
MIME-Version: 1.0
In-Reply-To: <1456996191.4882.17.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Abeni <pabeni@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>
Cc: Hannes Frederic Sowa <hannes@stressinduktion.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Dne 3.3.2016 v 10:09 Paolo Abeni napsal(a):
> I'm sorry, I try to dig a bit, but I did not find any distro agnostic
> kernel removal tools. Can you please point out some ?

There isn't any, so unfortunately we need a list of various
distro-specific methods, starting with ew-kernel-pkg. The %post script
should stay as is, though.

Michal
