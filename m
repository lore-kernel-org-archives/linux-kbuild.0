Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:52380 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735Ab2HOBNh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Aug 2012 21:13:37 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <dwg@au1.ibm.com>;
	Wed, 15 Aug 2012 11:12:48 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q7F14pRD13566036
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2012 11:04:52 +1000
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q7F1DOGh026192
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2012 11:13:25 +1000
Date: Wed, 15 Aug 2012 11:11:49 +1000
From: David Gibson <dwg@au1.ibm.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for
 Pre-Processing.
Message-ID: <20120815011149.GF8136@truffula.fritz.box>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mmarek@suse.cz

On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> 
> This patch add pre-processing capablity to dtc based on status property.
> Now the dtc has additional option -P to enable Pre-processing based on
> status property.
> 
> The SOCS have lot of device tree infrastructure files which mark the
> device nodes as disabled and the board level device tree enables them if
> required. However while creating device tree blob, the compiler can
> preprocess the nodes and exclude nodes marked as disabled, doing this
> way will reduce the size of device tree blob.
> 
> In our case this has reduced the blob size from 29K to 15K.
> 
> Also nodes with status="disabled" is are never probed by dt platform bus
> code.
> 
> Again, Preprocessing is optional parameter to dtc.

Hrm.

1) Changes to dtc should be made first against upstream dtc at
git://git.jdl.com/software/dtc.git.  The version in the kernel is just
a snapshot of the upstream tree which is updated periodically.

2) I'm not convinced this filtering-by-status is something that
belongs in dtc, but I'm willing to be persuaded.

3) The name has to change.  "preprocess" is far to general a term for
the very specific function you're implementing here.  Especially when
there are serious discussions ongoing about having dtc use cpp or a
similar preprocessor in a general capacity.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

