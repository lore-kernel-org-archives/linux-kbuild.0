Received: from mx-1.neto.net.il (mx-1.neto.net.il [212.76.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338773F58D6
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Oct 2026 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.76.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139857; cv=none; b=IRGcaYB/a1meIqVVf2WfLqCPV/TyWhQjdBv0hk0OvruZw+ILPXvYvu/VL8asys+0OSiSQZsjqTaD7Q2yBAPveZ78tz3BgA8gJMXRrj4qbpvopW2frHnRj+iqVgp6u2l34Z2GWwkeu4749S4qs4/vwWFrRWNZX9109TiyPFBtJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139857; c=relaxed/simple;
	bh=Q863Psp4lFf8weX0fhbahieyBuwOGEeQTT1C7WYaMSI=;
	h=Date:To:Subject:MIME-Version:Content-Type:Message-Id:From; b=rYF6b8aP567tLMVc17/AK+agrww8hs0mFIFETDcUFG1muudCmeu7Ze9BI4sIK7gbyq85qZIOq4uE+xg1hM+D1iYQ1cX2KqAyr3nmMV0Enh3MKIOruoZTTmZDbtBUzvQppXYNoI5gPChGc9yn7l3Y0VUKAQKL0M8gG5pUhAehnqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com; spf=pass smtp.mailfrom=skeeve.com; arc=none smtp.client-ip=212.76.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skeeve.com
Received: from [10.100.113.73] (helo=mail.neto.net.il)
	by mx-1.neto.net.il with esmtp (Exim 4.94.2)
	(envelope-from <arnold@skeeve.com>)
	id 1xDQvM-00D5OW-E6
	for linux-kbuild@vger.kernel.org; Sun, 04 Oct 2026 21:27:06 +0300
Received: from gleep.local (unknown [147.236.215.54])
	(Authenticated sender: arnold.robbins@netfiber.net.il)
	by mail.neto.net.il (Postfix) with ESMTPA id BD50A102461
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Oct 2026 21:26:58 +0300 (IDT)
Received: from arnold by gleep.local with local (Exim 4.97)
	(envelope-from <arnold@skeeve.com>)
	id 1xDQvK-00000000Kvi-2PZ4
	for linux-kbuild@vger.kernel.org;
	Sun, 04 Oct 2026 21:26:58 +0300
Date: Sun, 04 Oct 2026 21:26:58 +0300
To: linux-kbuild@vger.kernel.org
Subject: Use of `gawk -M' in kernel build scripts
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
From: Aharon Robbins <arnold@skeeve.com>
X-SpamExperts-Domain: neto.net.il
X-SpamExperts-Username: 10.100.113.73
Authentication-Results: neto.net.il; auth=pass smtp.auth=10.100.113.73@neto.net.il
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVzkKdCtcsyq2M+fj6t3NdnVaPuWW65IIT8
 lIUNtU+PTCu2SmbhJN1U9FKs8X3+Nt24MKCsax+SrGRfcOHGeJJfJrkpanAEqvk1RCHDgHRm62Ru
 tVdZdUk4la24/lWb/vxMc0mIca7FdVjtxP/DdWFdCtmoQhY2xrBb8C+tWUvqrqBKsSdhvd/J5sX5
 daZjkYvS3ZUXZgxmW6QwjdgZFt3xzthz0vNkOX8Em4cj6D/wdRoqQ/41lARYjuMHl4Jf5GFk2xh7
 EwnEMn/WN+LH0A8fmTmYf9felIf8Q0lvYJANy1im26jqdSLearSSTVIJyNKROUzReCS8EpKh0It9
 L25JS816nuiE0t5pG6MLXGczofW7JIvxs2g6vnejupB9Ytyg4tuFbqYFEpyEgxFhNBVNOTu5y+tm
 5k3TI7jvB4m24gdvWVe/Q4mXPvgCQTlRFw1UXD7036SCGN+yf9WCXlXI0gTlyBu7Q09+sA/R5AgC
 Xea0mUBTIIPSIgYLFZUgepQPV7vqzOxa8GxpL4pWK6wGmcWZhj/77f0PW0jLEvzHRWnMGpXc3iwP
 l0cLKsjGPxsSHb9Lm1H0nhmGKQmr2r8b0JVNltVfMJPK4u4RtRlnD9THGcCFk+M4RDByqT4uVwHz
 HQUGUGBsJVD9jTyj/7O39FVRDP+JylzaSdu+aGff4s0o+LNdicx5WrHyqHZTwpsSZfHNHNEAA7iv
 ceJEhE+rvvdpwNxxJ3g9UgrQ+/vusjyROz2i/r2f0YMNC2Ne0FVbwN4/fmnOqOQ/yUDrNZrmdbxN
 8xR9dk1AZciO5cIsumPq//epgCYlroYjF6b//sfDqcigOvSxdRnthmhn8Zn6s/DfuvCbhyFz3lKQ
 UYFgo1mlDk5wMDKTtm+BkBEZZC4L3m9JOxjBSTyS/AXtL63QIdVyTp5x6317je87oS4ac1AXBuw9
 zdpkI9WSfK1iMOR7C/K+2qSEGG7vBOO5IkeL
X-Report-Abuse-To: spam@mx-1.neto.net.il
X-Complaints-To: abuse@mx-1.neto.net.il

Hi All

I'm the maintainer for gawk. I see that it's used in the kernel build
scripts in combination with objdump.

In particular, I note that gawk is invoked with the -M option, which
uses MPFR for arithmetic (although the precision isn't changed beyond
the default which is the same as for IEEE hardware floating point).

I am wondering if the -M option is really needed here?  The reason I
ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
(I hope in Q2 2027) will issue a deprecation warning when -M is used,
and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
entirely.

So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
time to remove its use from the kernel build.

Please reply privately, as I'm not on the linux-kbuild list.

Much thanks,

Arnold Robbins
