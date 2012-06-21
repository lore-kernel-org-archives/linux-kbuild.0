Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from warthog.procyon.org.uk ([90.155.74.18]:53165 "EHLO
	warthog.procyon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760715Ab2FVAMa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Jun 2012 20:12:30 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1340306466.1773.60.camel@x61.thuisdomein>
References: <1340306466.1773.60.camel@x61.thuisdomein>
Subject: Re: [PATCH 2/3] Remove useless wrappers of asm-generic/ipc.h
Date: Fri, 22 Jun 2012 00:08:51 +0100
Message-ID: <32480.1340320131@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: dhowells@redhat.com, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Richard Kuo <rkuo@codeaurora.org>, linux-hexagon@vger.kernel.org, linux-am33-list@redhat.com, Chris Metcalf <cmetcalf@tilera.com>, linux-kernel@vger.kernel.org

Paul Bolle <pebolle@tiscali.nl> wrote:

> mn10300 has a header (in its include/asm directory) that is a thin
> wrapper around asm-generic/ipc.h. This wrapper is useless, since that
> header doesn't exist. It is also unused (no file includes asm/ipc.h).
> 
> hexagon and tile generate similar headers at build time (using a
> generic-y entry in include/asm/Kbuild). These generated headers are
> useless and unused too.
> 
> Remove this header and these generic-y entries.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Acked-by: David Howells <dhowells@redhat.com> [MN10300]
