Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu1sys200aog119.obsmtp.com ([207.126.144.147]:43225 "EHLO
	eu1sys200aog119.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753889Ab2HOJp0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Aug 2012 05:45:26 -0400
Message-ID: <502B6CD0.4060102@st.com>
Date: Wed, 15 Aug 2012 10:33:04 +0100
From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Reply-To: srinivas.kandagatla@st.com
MIME-Version: 1.0
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for Pre-Processing.
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com> <20120815011149.GF8136@truffula.fritz.box>
In-Reply-To: <20120815011149.GF8136@truffula.fritz.box>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Gibson <dwg@au1.ibm.com>
Cc: linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mmarek@suse.cz, B04825@freescale.com

On 15/08/12 02:11, David Gibson wrote:
> On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>
>> This patch add pre-processing capablity to dtc based on status property.
>> Now the dtc has additional option -P to enable Pre-processing based on
>> status property.
>>
>> The SOCS have lot of device tree infrastructure files which mark the
>> device nodes as disabled and the board level device tree enables them if
>> required. However while creating device tree blob, the compiler can
>> preprocess the nodes and exclude nodes marked as disabled, doing this
>> way will reduce the size of device tree blob.
>>
>> In our case this has reduced the blob size from 29K to 15K.
>>
>> Also nodes with status="disabled" is are never probed by dt platform bus
>> code.
>>
>> Again, Preprocessing is optional parameter to dtc.
> Hrm.
>
> 1) Changes to dtc should be made first against upstream dtc at
> git://git.jdl.com/software/dtc.git.  The version in the kernel is just
> a snapshot of the upstream tree which is updated periodically.
I agree, will re-base the patch against
git://git.jdl.com/software/dtc.git and add Jon Loeliger (dtc maintainer)
to CC.
> 2) I'm not convinced this filtering-by-status is something that
> belongs in dtc, but I'm willing to be persuaded.
As its not a default dtc behavior, Adding filtering-by-status as
optional to dtc would a good addition towards reducing overall dtb sizes.
>
> 3) The name has to change.  "preprocess" is far to general a term for
> the very specific function you're implementing here.  Especially when
> there are serious discussions ongoing about having dtc use cpp or a
> similar preprocessor in a general capacity.
Yes, Pre-process looks very generic, As Tabi suggested --strip-disabled
would be more appropriate.
Will repost the patch with this change.
>

