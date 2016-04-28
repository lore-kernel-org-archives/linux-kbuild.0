Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40324 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751884AbcD1MUv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 08:20:51 -0400
Subject: [net-next PATCH V4 0/5] samples/bpf: Improve user experience
From: Jesper Dangaard Brouer <brouer@redhat.com>
Date: Thu, 28 Apr 2016 14:20:48 +0200
Message-ID: <20160428121949.16807.84828.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: netdev@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, Jesper Dangaard Brouer <brouer@redhat.com>, naveen.n.rao@linux.vnet.ibm.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

It is a steep learning curve getting started with using the eBPF
examples in samples/bpf/.  There are several dependencies, and
specific versions of these dependencies.  Invoking make in the correct
manor is also slightly obscure.

This patchset cleanup, document and hopefully improves the first time
user experience with the eBPF samples directory by auto-detecting
certain scenarios.

V4:
 - Address Naveen's nitpicks
 - Handle/fail if extra args are passed in LLC or CLANG (David Laight)

V3:
 - Add Alexei's ACKs
 - Remove README paragraph about LLVM experimental BPF target
   as it only existed between LLVM version 3.6 to 3.7.

V2:
 - Adjusted recommend minimum versions to 3.7.1
 - Included clang build instructions
 - New patch adding CLANG variable and validation of command

---

Jesper Dangaard Brouer (5):
      samples/bpf: add back functionality to redefine LLC command
      samples/bpf: Makefile verify LLVM compiler avail and bpf target is supported
      samples/bpf: add a README file to get users started
      samples/bpf: allow make to be run from samples/bpf/ directory
      samples/bpf: like LLC also verify and allow redefining CLANG command


 samples/bpf/Makefile   |   37 +++++++++++++++++++++++++--
 samples/bpf/README.rst |   67 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 samples/bpf/README.rst

--
