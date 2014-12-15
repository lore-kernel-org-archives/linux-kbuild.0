Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:42302 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbaLOKAq convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:9:1>);
	Mon, 15 Dec 2014 05:00:46 -0500
Message-Id: <548EBF58020000780004F7E7@mail.emea.novell.com>
Date: Mon, 15 Dec 2014 10:00:40 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/4] xen: build infrastructure for
 generating hypercall depending symbols
References: <1418321065-10212-1-git-send-email-jgross@suse.com>
 <1418321065-10212-2-git-send-email-jgross@suse.com>
 <548B70B3.7030807@oracle.com>
In-Reply-To: <548B70B3.7030807@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: david.vrabel@citrix.com, x86@kernel.org, tglx@linutronix.de, xen-devel <xen-devel@lists.xenproject.org>, konrad.wilk@oracle.com, mingo@redhat.com, Juergen Gross <JGross@suse.com>, mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hpa@zytor.com

>>> On 12.12.14 at 23:48, <boris.ostrovsky@oracle.com> wrote:
> On 12/11/2014 01:04 PM, Juergen Gross wrote:
>> diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
>> new file mode 100644
>> index 0000000..e6447b7
>> --- /dev/null
>> +++ b/scripts/xen-hypercalls.sh
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +out="$1"
>> +shift
>> +in="$@"
>> +
>> +for i in $in; do
>> +	eval $CPP $LINUXINCLUDE -dD -imacros "$i" -x c /dev/null
>> +done | \
>> +awk '$1 == "#define" && $2 ~ /__HYPERVISOR_[a-z][a-z_0-9]*/ { v[$3] = $2 }
>> +	END {for (i in v) if (!(v[i] in v))
>> +		print "HYPERCALL("substr(v[i], 14)")"}' | sort -u >$out
> 
> Why do you 'sort -u'? Do you expect multiple definitions of the same 
> hypercall?

For upstream I think this could be dropped; the original version needs
this as the classic tree sticks more closely to the original xen.h (which
has a couple of backward compatibility defines which would get in the
way). Otoh it does no harm afaict...

Jan

