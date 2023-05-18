
89:     file format elf64-x86-64


Disassembly of section .init:

0000000000400528 <_init>:
  400528:	48 83 ec 08          	sub    $0x8,%rsp
  40052c:	48 8b 05 c5 1a 20 00 	mov    0x201ac5(%rip),%rax        # 601ff8 <__gmon_start__>
  400533:	48 85 c0             	test   %rax,%rax
  400536:	74 05                	je     40053d <_init+0x15>
  400538:	e8 93 00 00 00       	call   4005d0 <__gmon_start__@plt>
  40053d:	48 83 c4 08          	add    $0x8,%rsp
  400541:	c3                   	ret    

Disassembly of section .plt:

0000000000400550 <.plt>:
  400550:	ff 35 b2 1a 20 00    	push   0x201ab2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400556:	ff 25 b4 1a 20 00    	jmp    *0x201ab4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40055c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400560 <puts@plt>:
  400560:	ff 25 b2 1a 20 00    	jmp    *0x201ab2(%rip)        # 602018 <puts@GLIBC_2.2.5>
  400566:	68 00 00 00 00       	push   $0x0
  40056b:	e9 e0 ff ff ff       	jmp    400550 <.plt>

0000000000400570 <__stack_chk_fail@plt>:
  400570:	ff 25 aa 1a 20 00    	jmp    *0x201aaa(%rip)        # 602020 <__stack_chk_fail@GLIBC_2.4>
  400576:	68 01 00 00 00       	push   $0x1
  40057b:	e9 d0 ff ff ff       	jmp    400550 <.plt>

0000000000400580 <printf@plt>:
  400580:	ff 25 a2 1a 20 00    	jmp    *0x201aa2(%rip)        # 602028 <printf@GLIBC_2.2.5>
  400586:	68 02 00 00 00       	push   $0x2
  40058b:	e9 c0 ff ff ff       	jmp    400550 <.plt>

0000000000400590 <__libc_start_main@plt>:
  400590:	ff 25 9a 1a 20 00    	jmp    *0x201a9a(%rip)        # 602030 <__libc_start_main@GLIBC_2.2.5>
  400596:	68 03 00 00 00       	push   $0x3
  40059b:	e9 b0 ff ff ff       	jmp    400550 <.plt>

00000000004005a0 <strcmp@plt>:
  4005a0:	ff 25 92 1a 20 00    	jmp    *0x201a92(%rip)        # 602038 <strcmp@GLIBC_2.2.5>
  4005a6:	68 04 00 00 00       	push   $0x4
  4005ab:	e9 a0 ff ff ff       	jmp    400550 <.plt>

00000000004005b0 <malloc@plt>:
  4005b0:	ff 25 8a 1a 20 00    	jmp    *0x201a8a(%rip)        # 602040 <malloc@GLIBC_2.2.5>
  4005b6:	68 05 00 00 00       	push   $0x5
  4005bb:	e9 90 ff ff ff       	jmp    400550 <.plt>

00000000004005c0 <__isoc99_scanf@plt>:
  4005c0:	ff 25 82 1a 20 00    	jmp    *0x201a82(%rip)        # 602048 <__isoc99_scanf@GLIBC_2.7>
  4005c6:	68 06 00 00 00       	push   $0x6
  4005cb:	e9 80 ff ff ff       	jmp    400550 <.plt>

Disassembly of section .plt.got:

00000000004005d0 <__gmon_start__@plt>:
  4005d0:	ff 25 22 1a 20 00    	jmp    *0x201a22(%rip)        # 601ff8 <__gmon_start__>
  4005d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004005e0 <_start>:
  4005e0:	31 ed                	xor    %ebp,%ebp
  4005e2:	49 89 d1             	mov    %rdx,%r9
  4005e5:	5e                   	pop    %rsi
  4005e6:	48 89 e2             	mov    %rsp,%rdx
  4005e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4005ed:	50                   	push   %rax
  4005ee:	54                   	push   %rsp
  4005ef:	49 c7 c0 a0 10 40 00 	mov    $0x4010a0,%r8
  4005f6:	48 c7 c1 30 10 40 00 	mov    $0x401030,%rcx
  4005fd:	48 c7 c7 e2 0b 40 00 	mov    $0x400be2,%rdi
  400604:	e8 87 ff ff ff       	call   400590 <__libc_start_main@plt>
  400609:	f4                   	hlt    
  40060a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400610 <deregister_tm_clones>:
  400610:	b8 6f 20 60 00       	mov    $0x60206f,%eax
  400615:	55                   	push   %rbp
  400616:	48 2d 68 20 60 00    	sub    $0x602068,%rax
  40061c:	48 83 f8 0e          	cmp    $0xe,%rax
  400620:	48 89 e5             	mov    %rsp,%rbp
  400623:	76 1b                	jbe    400640 <deregister_tm_clones+0x30>
  400625:	b8 00 00 00 00       	mov    $0x0,%eax
  40062a:	48 85 c0             	test   %rax,%rax
  40062d:	74 11                	je     400640 <deregister_tm_clones+0x30>
  40062f:	5d                   	pop    %rbp
  400630:	bf 68 20 60 00       	mov    $0x602068,%edi
  400635:	ff e0                	jmp    *%rax
  400637:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40063e:	00 00 
  400640:	5d                   	pop    %rbp
  400641:	c3                   	ret    
  400642:	0f 1f 40 00          	nopl   0x0(%rax)
  400646:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40064d:	00 00 00 

0000000000400650 <register_tm_clones>:
  400650:	be 68 20 60 00       	mov    $0x602068,%esi
  400655:	55                   	push   %rbp
  400656:	48 81 ee 68 20 60 00 	sub    $0x602068,%rsi
  40065d:	48 c1 fe 03          	sar    $0x3,%rsi
  400661:	48 89 e5             	mov    %rsp,%rbp
  400664:	48 89 f0             	mov    %rsi,%rax
  400667:	48 c1 e8 3f          	shr    $0x3f,%rax
  40066b:	48 01 c6             	add    %rax,%rsi
  40066e:	48 d1 fe             	sar    %rsi
  400671:	74 15                	je     400688 <register_tm_clones+0x38>
  400673:	b8 00 00 00 00       	mov    $0x0,%eax
  400678:	48 85 c0             	test   %rax,%rax
  40067b:	74 0b                	je     400688 <register_tm_clones+0x38>
  40067d:	5d                   	pop    %rbp
  40067e:	bf 68 20 60 00       	mov    $0x602068,%edi
  400683:	ff e0                	jmp    *%rax
  400685:	0f 1f 00             	nopl   (%rax)
  400688:	5d                   	pop    %rbp
  400689:	c3                   	ret    
  40068a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400690 <__do_global_dtors_aux>:
  400690:	80 3d d1 19 20 00 00 	cmpb   $0x0,0x2019d1(%rip)        # 602068 <__TMC_END__>
  400697:	75 11                	jne    4006aa <__do_global_dtors_aux+0x1a>
  400699:	55                   	push   %rbp
  40069a:	48 89 e5             	mov    %rsp,%rbp
  40069d:	e8 6e ff ff ff       	call   400610 <deregister_tm_clones>
  4006a2:	5d                   	pop    %rbp
  4006a3:	c6 05 be 19 20 00 01 	movb   $0x1,0x2019be(%rip)        # 602068 <__TMC_END__>
  4006aa:	f3 c3                	repz ret 
  4006ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006b0 <frame_dummy>:
  4006b0:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  4006b5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4006b9:	75 05                	jne    4006c0 <frame_dummy+0x10>
  4006bb:	eb 93                	jmp    400650 <register_tm_clones>
  4006bd:	0f 1f 00             	nopl   (%rax)
  4006c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4006c5:	48 85 c0             	test   %rax,%rax
  4006c8:	74 f1                	je     4006bb <frame_dummy+0xb>
  4006ca:	55                   	push   %rbp
  4006cb:	48 89 e5             	mov    %rsp,%rbp
  4006ce:	ff d0                	call   *%rax
  4006d0:	5d                   	pop    %rbp
  4006d1:	e9 7a ff ff ff       	jmp    400650 <register_tm_clones>

00000000004006d6 <hyp>:
  4006d6:	55                   	push   %rbp
  4006d7:	48 89 e5             	mov    %rsp,%rbp
  4006da:	bf b8 10 40 00       	mov    $0x4010b8,%edi
  4006df:	e8 7c fe ff ff       	call   400560 <puts@plt>
  4006e4:	90                   	nop
  4006e5:	5d                   	pop    %rbp
  4006e6:	c3                   	ret    

00000000004006e7 <smit_not_good_enough>:
  4006e7:	55                   	push   %rbp
  4006e8:	48 89 e5             	mov    %rsp,%rbp
  4006eb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4006ef:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  4006f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4006f7:	8b 00                	mov    (%rax),%eax
  4006f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4006fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  400700:	8b 10                	mov    (%rax),%edx
  400702:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400706:	89 10                	mov    %edx,(%rax)
  400708:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  40070c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  40070f:	89 10                	mov    %edx,(%rax)
  400711:	90                   	nop
  400712:	5d                   	pop    %rbp
  400713:	c3                   	ret    

0000000000400714 <printvv>:
  400714:	55                   	push   %rbp
  400715:	48 89 e5             	mov    %rsp,%rbp
  400718:	48 83 ec 40          	sub    $0x40,%rsp
  40071c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  40071f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400726:	00 00 
  400728:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40072c:	31 c0                	xor    %eax,%eax
  40072e:	48 b8 79 6f 75 20 64 	movabs $0x6e206f6420756f79,%rax
  400735:	6f 20 6e 
  400738:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  40073c:	48 b8 6f 74 20 68 61 	movabs $0x206576616820746f,%rax
  400743:	76 65 20 
  400746:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  40074a:	48 b8 74 68 65 20 61 	movabs $0x6563636120656874,%rax
  400751:	63 63 65 
  400754:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  400758:	48 b8 73 73 20 68 65 	movabs $0x65726568207373,%rax
  40075f:	72 65 00 
  400762:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  400766:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  40076d:	00 
  40076e:	90                   	nop
  40076f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400773:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40077a:	00 00 
  40077c:	74 05                	je     400783 <printvv+0x6f>
  40077e:	e8 ed fd ff ff       	call   400570 <__stack_chk_fail@plt>
  400783:	c9                   	leave  
  400784:	c3                   	ret    

0000000000400785 <printuu>:
  400785:	55                   	push   %rbp
  400786:	48 89 e5             	mov    %rsp,%rbp
  400789:	48 83 ec 10          	sub    $0x10,%rsp
  40078d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400790:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400793:	89 c6                	mov    %eax,%esi
  400795:	bf d8 10 40 00       	mov    $0x4010d8,%edi
  40079a:	b8 00 00 00 00       	mov    $0x0,%eax
  40079f:	e8 dc fd ff ff       	call   400580 <printf@plt>
  4007a4:	90                   	nop
  4007a5:	c9                   	leave  
  4007a6:	c3                   	ret    

00000000004007a7 <TEAMBEN>:
  4007a7:	55                   	push   %rbp
  4007a8:	48 89 e5             	mov    %rsp,%rbp
  4007ab:	89 7d ec             	mov    %edi,-0x14(%rbp)
  4007ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  4007b1:	89 45 f0             	mov    %eax,-0x10(%rbp)
  4007b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  4007bb:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  4007c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  4007c9:	eb 73                	jmp    40083e <TEAMBEN+0x97>
  4007cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4007ce:	83 e0 01             	and    $0x1,%eax
  4007d1:	85 c0                	test   %eax,%eax
  4007d3:	75 28                	jne    4007fd <TEAMBEN+0x56>
  4007d5:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  4007d8:	ba 67 66 66 66       	mov    $0x66666667,%edx
  4007dd:	89 c8                	mov    %ecx,%eax
  4007df:	f7 ea                	imul   %edx
  4007e1:	c1 fa 02             	sar    $0x2,%edx
  4007e4:	89 c8                	mov    %ecx,%eax
  4007e6:	c1 f8 1f             	sar    $0x1f,%eax
  4007e9:	29 c2                	sub    %eax,%edx
  4007eb:	89 d0                	mov    %edx,%eax
  4007ed:	c1 e0 02             	shl    $0x2,%eax
  4007f0:	01 d0                	add    %edx,%eax
  4007f2:	01 c0                	add    %eax,%eax
  4007f4:	29 c1                	sub    %eax,%ecx
  4007f6:	89 ca                	mov    %ecx,%edx
  4007f8:	01 55 f8             	add    %edx,-0x8(%rbp)
  4007fb:	eb 26                	jmp    400823 <TEAMBEN+0x7c>
  4007fd:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  400800:	ba 67 66 66 66       	mov    $0x66666667,%edx
  400805:	89 c8                	mov    %ecx,%eax
  400807:	f7 ea                	imul   %edx
  400809:	c1 fa 02             	sar    $0x2,%edx
  40080c:	89 c8                	mov    %ecx,%eax
  40080e:	c1 f8 1f             	sar    $0x1f,%eax
  400811:	29 c2                	sub    %eax,%edx
  400813:	89 d0                	mov    %edx,%eax
  400815:	c1 e0 02             	shl    $0x2,%eax
  400818:	01 d0                	add    %edx,%eax
  40081a:	01 c0                	add    %eax,%eax
  40081c:	29 c1                	sub    %eax,%ecx
  40081e:	89 ca                	mov    %ecx,%edx
  400820:	01 55 f4             	add    %edx,-0xc(%rbp)
  400823:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  400826:	ba 67 66 66 66       	mov    $0x66666667,%edx
  40082b:	89 c8                	mov    %ecx,%eax
  40082d:	f7 ea                	imul   %edx
  40082f:	c1 fa 02             	sar    $0x2,%edx
  400832:	89 c8                	mov    %ecx,%eax
  400834:	c1 f8 1f             	sar    $0x1f,%eax
  400837:	29 c2                	sub    %eax,%edx
  400839:	89 d0                	mov    %edx,%eax
  40083b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  40083e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  400842:	7f 87                	jg     4007cb <TEAMBEN+0x24>
  400844:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400847:	2b 45 f4             	sub    -0xc(%rbp),%eax
  40084a:	89 c1                	mov    %eax,%ecx
  40084c:	ba e9 a2 8b 2e       	mov    $0x2e8ba2e9,%edx
  400851:	89 c8                	mov    %ecx,%eax
  400853:	f7 ea                	imul   %edx
  400855:	d1 fa                	sar    %edx
  400857:	89 c8                	mov    %ecx,%eax
  400859:	c1 f8 1f             	sar    $0x1f,%eax
  40085c:	29 c2                	sub    %eax,%edx
  40085e:	89 d0                	mov    %edx,%eax
  400860:	c1 e0 02             	shl    $0x2,%eax
  400863:	01 d0                	add    %edx,%eax
  400865:	01 c0                	add    %eax,%eax
  400867:	01 d0                	add    %edx,%eax
  400869:	29 c1                	sub    %eax,%ecx
  40086b:	89 ca                	mov    %ecx,%edx
  40086d:	85 d2                	test   %edx,%edx
  40086f:	75 07                	jne    400878 <TEAMBEN+0xd1>
  400871:	b8 01 00 00 00       	mov    $0x1,%eax
  400876:	eb 05                	jmp    40087d <TEAMBEN+0xd6>
  400878:	b8 00 00 00 00       	mov    $0x0,%eax
  40087d:	5d                   	pop    %rbp
  40087e:	c3                   	ret    

000000000040087f <timmy>:
  40087f:	55                   	push   %rbp
  400880:	48 89 e5             	mov    %rsp,%rbp
  400883:	b8 00 00 00 00       	mov    $0x0,%eax
  400888:	e8 49 fe ff ff       	call   4006d6 <hyp>
  40088d:	b8 d8 ff ff ff       	mov    $0xffffffd8,%eax
  400892:	5d                   	pop    %rbp
  400893:	c3                   	ret    

0000000000400894 <kenny>:
  400894:	55                   	push   %rbp
  400895:	48 89 e5             	mov    %rsp,%rbp
  400898:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
  40089f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4008a6:	00 00 
  4008a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4008ac:	31 c0                	xor    %eax,%eax
  4008ae:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%rbp)
  4008b5:	00 00 00 
  4008b8:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%rbp)
  4008bf:	00 00 00 
  4008c2:	8b 05 9c 17 20 00    	mov    0x20179c(%rip),%eax        # 602064 <y>
  4008c8:	85 c0                	test   %eax,%eax
  4008ca:	75 0a                	jne    4008d6 <kenny+0x42>
  4008cc:	c7 85 7c ff ff ff 01 	movl   $0x1,-0x84(%rbp)
  4008d3:	00 00 00 
  4008d6:	c7 45 80 00 00 00 00 	movl   $0x0,-0x80(%rbp)
  4008dd:	eb 37                	jmp    400916 <kenny+0x82>
  4008df:	8b 45 80             	mov    -0x80(%rbp),%eax
  4008e2:	83 c0 01             	add    $0x1,%eax
  4008e5:	0f af 45 80          	imul   -0x80(%rbp),%eax
  4008e9:	89 c2                	mov    %eax,%edx
  4008eb:	8b 45 80             	mov    -0x80(%rbp),%eax
  4008ee:	48 98                	cltq   
  4008f0:	89 54 85 90          	mov    %edx,-0x70(%rbp,%rax,4)
  4008f4:	83 bd 7c ff ff ff 00 	cmpl   $0x0,-0x84(%rbp)
  4008fb:	75 15                	jne    400912 <kenny+0x7e>
  4008fd:	8b 05 5d 17 20 00    	mov    0x20175d(%rip),%eax        # 602060 <x>
  400903:	8b 3d 5b 17 20 00    	mov    0x20175b(%rip),%edi        # 602064 <y>
  400909:	99                   	cltd   
  40090a:	f7 ff                	idiv   %edi
  40090c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
  400912:	83 45 80 01          	addl   $0x1,-0x80(%rbp)
  400916:	83 7d 80 16          	cmpl   $0x16,-0x80(%rbp)
  40091a:	7e c3                	jle    4008df <kenny+0x4b>
  40091c:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
  400922:	89 45 8c             	mov    %eax,-0x74(%rbp)
  400925:	c7 45 84 00 00 00 00 	movl   $0x0,-0x7c(%rbp)
  40092c:	eb 6c                	jmp    40099a <kenny+0x106>
  40092e:	c7 45 88 00 00 00 00 	movl   $0x0,-0x78(%rbp)
  400935:	eb 59                	jmp    400990 <kenny+0xfc>
  400937:	8b 45 88             	mov    -0x78(%rbp),%eax
  40093a:	48 98                	cltq   
  40093c:	8b 54 85 90          	mov    -0x70(%rbp,%rax,4),%edx
  400940:	8b 45 84             	mov    -0x7c(%rbp),%eax
  400943:	48 98                	cltq   
  400945:	8b 44 85 90          	mov    -0x70(%rbp,%rax,4),%eax
  400949:	39 c2                	cmp    %eax,%edx
  40094b:	7e 2d                	jle    40097a <kenny+0xe6>
  40094d:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  400951:	8b 55 88             	mov    -0x78(%rbp),%edx
  400954:	48 63 d2             	movslq %edx,%rdx
  400957:	48 c1 e2 02          	shl    $0x2,%rdx
  40095b:	48 01 c2             	add    %rax,%rdx
  40095e:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  400962:	8b 4d 84             	mov    -0x7c(%rbp),%ecx
  400965:	48 63 c9             	movslq %ecx,%rcx
  400968:	48 c1 e1 02          	shl    $0x2,%rcx
  40096c:	48 01 c8             	add    %rcx,%rax
  40096f:	48 89 d6             	mov    %rdx,%rsi
  400972:	48 89 c7             	mov    %rax,%rdi
  400975:	e8 6d fd ff ff       	call   4006e7 <smit_not_good_enough>
  40097a:	8b 05 e4 16 20 00    	mov    0x2016e4(%rip),%eax        # 602064 <y>
  400980:	8b 55 8c             	mov    -0x74(%rbp),%edx
  400983:	0f af c2             	imul   %edx,%eax
  400986:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
  40098c:	83 45 88 01          	addl   $0x1,-0x78(%rbp)
  400990:	83 7d 88 16          	cmpl   $0x16,-0x78(%rbp)
  400994:	7e a1                	jle    400937 <kenny+0xa3>
  400996:	83 45 84 01          	addl   $0x1,-0x7c(%rbp)
  40099a:	83 7d 84 16          	cmpl   $0x16,-0x7c(%rbp)
  40099e:	7e 8e                	jle    40092e <kenny+0x9a>
  4009a0:	8b 05 ba 16 20 00    	mov    0x2016ba(%rip),%eax        # 602060 <x>
  4009a6:	2b 85 78 ff ff ff    	sub    -0x88(%rbp),%eax
  4009ac:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
  4009b2:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
  4009b8:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
  4009bc:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4009c3:	00 00 
  4009c5:	74 05                	je     4009cc <kenny+0x138>
  4009c7:	e8 a4 fb ff ff       	call   400570 <__stack_chk_fail@plt>
  4009cc:	c9                   	leave  
  4009cd:	c3                   	ret    

00000000004009ce <overcome>:
  4009ce:	55                   	push   %rbp
  4009cf:	48 89 e5             	mov    %rsp,%rbp
  4009d2:	48 83 ec 70          	sub    $0x70,%rsp
  4009d6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4009dd:	00 00 
  4009df:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4009e3:	31 c0                	xor    %eax,%eax
  4009e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4009ea:	e8 e7 fc ff ff       	call   4006d6 <hyp>
  4009ef:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
  4009f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  4009f8:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  4009ff:	00 00 
  400a01:	74 05                	je     400a08 <overcome+0x3a>
  400a03:	e8 68 fb ff ff       	call   400570 <__stack_chk_fail@plt>
  400a08:	c9                   	leave  
  400a09:	c3                   	ret    

0000000000400a0a <sakura>:
  400a0a:	55                   	push   %rbp
  400a0b:	48 89 e5             	mov    %rsp,%rbp
  400a0e:	53                   	push   %rbx
  400a0f:	48 83 ec 18          	sub    $0x18,%rsp
  400a13:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400a1a:	00 00 
  400a1c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  400a20:	31 c0                	xor    %eax,%eax
  400a22:	48 89 e0             	mov    %rsp,%rax
  400a25:	48 89 c3             	mov    %rax,%rbx
  400a28:	b8 00 00 00 00       	mov    $0x0,%eax
  400a2d:	e8 a4 fc ff ff       	call   4006d6 <hyp>
  400a32:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
  400a37:	48 89 dc             	mov    %rbx,%rsp
  400a3a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400a3e:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  400a45:	00 00 
  400a47:	74 05                	je     400a4e <sakura+0x44>
  400a49:	e8 22 fb ff ff       	call   400570 <__stack_chk_fail@plt>
  400a4e:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  400a52:	c9                   	leave  
  400a53:	c3                   	ret    

0000000000400a54 <pink>:
  400a54:	55                   	push   %rbp
  400a55:	48 89 e5             	mov    %rsp,%rbp
  400a58:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  400a5c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  400a63:	8b 15 f7 15 20 00    	mov    0x2015f7(%rip),%edx        # 602060 <x>
  400a69:	8b 05 f5 15 20 00    	mov    0x2015f5(%rip),%eax        # 602064 <y>
  400a6f:	29 c2                	sub    %eax,%edx
  400a71:	89 d0                	mov    %edx,%eax
  400a73:	89 45 fc             	mov    %eax,-0x4(%rbp)
  400a76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400a79:	48 63 d0             	movslq %eax,%rdx
  400a7c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400a80:	48 01 d0             	add    %rdx,%rax
  400a83:	0f b6 00             	movzbl (%rax),%eax
  400a86:	84 c0                	test   %al,%al
  400a88:	74 06                	je     400a90 <pink+0x3c>
  400a8a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  400a8e:	eb d3                	jmp    400a63 <pink+0xf>
  400a90:	90                   	nop
  400a91:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400a94:	5d                   	pop    %rbp
  400a95:	c3                   	ret    

0000000000400a96 <summation>:
  400a96:	55                   	push   %rbp
  400a97:	48 89 e5             	mov    %rsp,%rbp
  400a9a:	8b 15 c0 15 20 00    	mov    0x2015c0(%rip),%edx        # 602060 <x>
  400aa0:	8b 05 be 15 20 00    	mov    0x2015be(%rip),%eax        # 602064 <y>
  400aa6:	01 d0                	add    %edx,%eax
  400aa8:	5d                   	pop    %rbp
  400aa9:	c3                   	ret    

0000000000400aaa <first>:
  400aaa:	55                   	push   %rbp
  400aab:	48 89 e5             	mov    %rsp,%rbp
  400aae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400ab2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400ab6:	0f b6 00             	movzbl (%rax),%eax
  400ab9:	0f be c0             	movsbl %al,%eax
  400abc:	83 c0 19             	add    $0x19,%eax
  400abf:	5d                   	pop    %rbp
  400ac0:	c3                   	ret    

0000000000400ac1 <second>:
  400ac1:	55                   	push   %rbp
  400ac2:	48 89 e5             	mov    %rsp,%rbp
  400ac5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400ac9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400acd:	48 83 c0 01          	add    $0x1,%rax
  400ad1:	0f b6 00             	movzbl (%rax),%eax
  400ad4:	0f be c0             	movsbl %al,%eax
  400ad7:	83 e8 19             	sub    $0x19,%eax
  400ada:	5d                   	pop    %rbp
  400adb:	c3                   	ret    

0000000000400adc <third>:
  400adc:	55                   	push   %rbp
  400add:	48 89 e5             	mov    %rsp,%rbp
  400ae0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400ae4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400ae8:	48 83 c0 02          	add    $0x2,%rax
  400aec:	0f b6 00             	movzbl (%rax),%eax
  400aef:	0f be c0             	movsbl %al,%eax
  400af2:	83 e8 28             	sub    $0x28,%eax
  400af5:	5d                   	pop    %rbp
  400af6:	c3                   	ret    

0000000000400af7 <fourth>:
  400af7:	55                   	push   %rbp
  400af8:	48 89 e5             	mov    %rsp,%rbp
  400afb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400aff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b03:	48 83 c0 03          	add    $0x3,%rax
  400b07:	0f b6 00             	movzbl (%rax),%eax
  400b0a:	0f be c0             	movsbl %al,%eax
  400b0d:	83 c0 0a             	add    $0xa,%eax
  400b10:	5d                   	pop    %rbp
  400b11:	c3                   	ret    

0000000000400b12 <fifth>:
  400b12:	55                   	push   %rbp
  400b13:	48 89 e5             	mov    %rsp,%rbp
  400b16:	48 83 ec 20          	sub    $0x20,%rsp
  400b1a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  400b1e:	bf 0a 00 00 00       	mov    $0xa,%edi
  400b23:	e8 88 fa ff ff       	call   4005b0 <malloc@plt>
  400b28:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400b2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  400b33:	eb 23                	jmp    400b58 <fifth+0x46>
  400b35:	8b 45 f4             	mov    -0xc(%rbp),%eax
  400b38:	48 63 d0             	movslq %eax,%rdx
  400b3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b3f:	48 01 c2             	add    %rax,%rdx
  400b42:	8b 45 f4             	mov    -0xc(%rbp),%eax
  400b45:	48 63 c8             	movslq %eax,%rcx
  400b48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400b4c:	48 01 c8             	add    %rcx,%rax
  400b4f:	0f b6 00             	movzbl (%rax),%eax
  400b52:	88 02                	mov    %al,(%rdx)
  400b54:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  400b58:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
  400b5c:	7e d7                	jle    400b35 <fifth+0x23>
  400b5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b62:	48 83 c0 07          	add    $0x7,%rax
  400b66:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400b6a:	48 83 c2 07          	add    $0x7,%rdx
  400b6e:	0f b6 12             	movzbl (%rdx),%edx
  400b71:	83 c2 0a             	add    $0xa,%edx
  400b74:	88 10                	mov    %dl,(%rax)
  400b76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b7a:	48 83 c0 05          	add    $0x5,%rax
  400b7e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400b82:	48 83 c2 05          	add    $0x5,%rdx
  400b86:	0f b6 12             	movzbl (%rdx),%edx
  400b89:	83 ea 05             	sub    $0x5,%edx
  400b8c:	88 10                	mov    %dl,(%rax)
  400b8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b92:	48 83 c0 06          	add    $0x6,%rax
  400b96:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400b9a:	48 83 c2 06          	add    $0x6,%rdx
  400b9e:	0f b6 12             	movzbl (%rdx),%edx
  400ba1:	83 c2 0b             	add    $0xb,%edx
  400ba4:	88 10                	mov    %dl,(%rax)
  400ba6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400baa:	48 83 c0 04          	add    $0x4,%rax
  400bae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400bb2:	48 83 c2 04          	add    $0x4,%rdx
  400bb6:	0f b6 12             	movzbl (%rdx),%edx
  400bb9:	83 ea 02             	sub    $0x2,%edx
  400bbc:	88 10                	mov    %dl,(%rax)
  400bbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400bc2:	c9                   	leave  
  400bc3:	c3                   	ret    

0000000000400bc4 <wowie>:
  400bc4:	55                   	push   %rbp
  400bc5:	48 89 e5             	mov    %rsp,%rbp
  400bc8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400bcc:	b8 64 00 00 00       	mov    $0x64,%eax
  400bd1:	5d                   	pop    %rbp
  400bd2:	c3                   	ret    

0000000000400bd3 <other>:
  400bd3:	55                   	push   %rbp
  400bd4:	48 89 e5             	mov    %rsp,%rbp
  400bd7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400bdb:	b8 18 00 00 00       	mov    $0x18,%eax
  400be0:	5d                   	pop    %rbp
  400be1:	c3                   	ret    

0000000000400be2 <main>:
  400be2:	55                   	push   %rbp
  400be3:	48 89 e5             	mov    %rsp,%rbp
  400be6:	48 83 ec 60          	sub    $0x60,%rsp
  400bea:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400bf1:	00 00 
  400bf3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400bf7:	31 c0                	xor    %eax,%eax
  400bf9:	bf dc 10 40 00       	mov    $0x4010dc,%edi
  400bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  400c03:	e8 78 f9 ff ff       	call   400580 <printf@plt>
  400c08:	be 60 20 60 00       	mov    $0x602060,%esi
  400c0d:	bf f4 10 40 00       	mov    $0x4010f4,%edi
  400c12:	b8 00 00 00 00       	mov    $0x0,%eax
  400c17:	e8 a4 f9 ff ff       	call   4005c0 <__isoc99_scanf@plt>
  400c1c:	bf f7 10 40 00       	mov    $0x4010f7,%edi
  400c21:	b8 00 00 00 00       	mov    $0x0,%eax
  400c26:	e8 55 f9 ff ff       	call   400580 <printf@plt>
  400c2b:	be 64 20 60 00       	mov    $0x602064,%esi
  400c30:	bf f4 10 40 00       	mov    $0x4010f4,%edi
  400c35:	b8 00 00 00 00       	mov    $0x0,%eax
  400c3a:	e8 81 f9 ff ff       	call   4005c0 <__isoc99_scanf@plt>
  400c3f:	bf 18 11 40 00       	mov    $0x401118,%edi
  400c44:	b8 00 00 00 00       	mov    $0x0,%eax
  400c49:	e8 32 f9 ff ff       	call   400580 <printf@plt>
  400c4e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400c52:	48 89 c6             	mov    %rax,%rsi
  400c55:	bf 4e 11 40 00       	mov    $0x40114e,%edi
  400c5a:	b8 00 00 00 00       	mov    $0x0,%eax
  400c5f:	e8 5c f9 ff ff       	call   4005c0 <__isoc99_scanf@plt>
  400c64:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400c68:	48 89 c6             	mov    %rax,%rsi
  400c6b:	bf 51 11 40 00       	mov    $0x401151,%edi
  400c70:	e8 2b f9 ff ff       	call   4005a0 <strcmp@plt>
  400c75:	85 c0                	test   %eax,%eax
  400c77:	75 2b                	jne    400ca4 <main+0xc2>
  400c79:	b8 00 00 00 00       	mov    $0x0,%eax
  400c7e:	e8 13 fe ff ff       	call   400a96 <summation>
  400c83:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  400c86:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  400c89:	89 c6                	mov    %eax,%esi
  400c8b:	bf d8 10 40 00       	mov    $0x4010d8,%edi
  400c90:	b8 00 00 00 00       	mov    $0x0,%eax
  400c95:	e8 e6 f8 ff ff       	call   400580 <printf@plt>
  400c9a:	b8 00 00 00 00       	mov    $0x0,%eax
  400c9f:	e9 70 03 00 00       	jmp    401014 <main+0x432>
  400ca4:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400ca8:	48 89 c7             	mov    %rax,%rdi
  400cab:	e8 23 ff ff ff       	call   400bd3 <other>
  400cb0:	83 f8 17             	cmp    $0x17,%eax
  400cb3:	7f 14                	jg     400cc9 <main+0xe7>
  400cb5:	b8 00 00 00 00       	mov    $0x0,%eax
  400cba:	e8 17 fa ff ff       	call   4006d6 <hyp>
  400cbf:	b8 00 00 00 00       	mov    $0x0,%eax
  400cc4:	e9 4b 03 00 00       	jmp    401014 <main+0x432>
  400cc9:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400ccd:	48 89 c7             	mov    %rax,%rdi
  400cd0:	e8 7f fd ff ff       	call   400a54 <pink>
  400cd5:	83 f8 08             	cmp    $0x8,%eax
  400cd8:	74 14                	je     400cee <main+0x10c>
  400cda:	b8 00 00 00 00       	mov    $0x0,%eax
  400cdf:	e8 f2 f9 ff ff       	call   4006d6 <hyp>
  400ce4:	b8 00 00 00 00       	mov    $0x0,%eax
  400ce9:	e9 26 03 00 00       	jmp    401014 <main+0x432>
  400cee:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400cf2:	48 89 c7             	mov    %rax,%rdi
  400cf5:	e8 b0 fd ff ff       	call   400aaa <first>
  400cfa:	3d 8c 00 00 00       	cmp    $0x8c,%eax
  400cff:	0f 85 bd 02 00 00    	jne    400fc2 <main+0x3e0>
  400d05:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400d09:	48 89 c7             	mov    %rax,%rdi
  400d0c:	e8 b0 fd ff ff       	call   400ac1 <second>
  400d11:	83 f8 50             	cmp    $0x50,%eax
  400d14:	75 1c                	jne    400d32 <main+0x150>
  400d16:	b8 00 00 00 00       	mov    $0x0,%eax
  400d1b:	e8 5f fb ff ff       	call   40087f <timmy>
  400d20:	89 45 cc             	mov    %eax,-0x34(%rbp)
  400d23:	8b 45 cc             	mov    -0x34(%rbp),%eax
  400d26:	89 c7                	mov    %eax,%edi
  400d28:	e8 e7 f9 ff ff       	call   400714 <printvv>
  400d2d:	e9 dd 02 00 00       	jmp    40100f <main+0x42d>
  400d32:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400d36:	48 89 c7             	mov    %rax,%rdi
  400d39:	e8 83 fd ff ff       	call   400ac1 <second>
  400d3e:	83 f8 5d             	cmp    $0x5d,%eax
  400d41:	7f 1c                	jg     400d5f <main+0x17d>
  400d43:	b8 00 00 00 00       	mov    $0x0,%eax
  400d48:	e8 81 fc ff ff       	call   4009ce <overcome>
  400d4d:	89 45 c8             	mov    %eax,-0x38(%rbp)
  400d50:	8b 45 c8             	mov    -0x38(%rbp),%eax
  400d53:	89 c7                	mov    %eax,%edi
  400d55:	e8 ba f9 ff ff       	call   400714 <printvv>
  400d5a:	e9 b0 02 00 00       	jmp    40100f <main+0x42d>
  400d5f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400d63:	48 89 c7             	mov    %rax,%rdi
  400d66:	e8 56 fd ff ff       	call   400ac1 <second>
  400d6b:	83 f8 5e             	cmp    $0x5e,%eax
  400d6e:	0f 85 30 02 00 00    	jne    400fa4 <main+0x3c2>
  400d74:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400d78:	48 89 c7             	mov    %rax,%rdi
  400d7b:	e8 5c fd ff ff       	call   400adc <third>
  400d80:	83 f8 53             	cmp    $0x53,%eax
  400d83:	0f 85 e6 01 00 00    	jne    400f6f <main+0x38d>
  400d89:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400d8d:	48 89 c7             	mov    %rax,%rdi
  400d90:	e8 62 fd ff ff       	call   400af7 <fourth>
  400d95:	83 f8 7e             	cmp    $0x7e,%eax
  400d98:	75 21                	jne    400dbb <main+0x1d9>
  400d9a:	b8 00 00 00 00       	mov    $0x0,%eax
  400d9f:	e8 db fa ff ff       	call   40087f <timmy>
  400da4:	89 45 a8             	mov    %eax,-0x58(%rbp)
  400da7:	8b 45 a8             	mov    -0x58(%rbp),%eax
  400daa:	89 c7                	mov    %eax,%edi
  400dac:	e8 63 f9 ff ff       	call   400714 <printvv>
  400db1:	b8 00 00 00 00       	mov    $0x0,%eax
  400db6:	e9 59 02 00 00       	jmp    401014 <main+0x432>
  400dbb:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400dbf:	48 89 c7             	mov    %rax,%rdi
  400dc2:	e8 30 fd ff ff       	call   400af7 <fourth>
  400dc7:	3d 88 00 00 00       	cmp    $0x88,%eax
  400dcc:	0f 85 3d 02 00 00    	jne    40100f <main+0x42d>
  400dd2:	bf 0a 00 00 00       	mov    $0xa,%edi
  400dd7:	e8 d4 f7 ff ff       	call   4005b0 <malloc@plt>
  400ddc:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  400de0:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  400de7:	eb 1d                	jmp    400e06 <main+0x224>
  400de9:	8b 45 a0             	mov    -0x60(%rbp),%eax
  400dec:	48 63 d0             	movslq %eax,%rdx
  400def:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400df3:	48 01 c2             	add    %rax,%rdx
  400df6:	8b 45 a0             	mov    -0x60(%rbp),%eax
  400df9:	48 98                	cltq   
  400dfb:	0f b6 44 05 e0       	movzbl -0x20(%rbp,%rax,1),%eax
  400e00:	88 02                	mov    %al,(%rdx)
  400e02:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
  400e06:	83 7d a0 03          	cmpl   $0x3,-0x60(%rbp)
  400e0a:	7e dd                	jle    400de9 <main+0x207>
  400e0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e10:	48 83 c0 07          	add    $0x7,%rax
  400e14:	0f b6 55 e7          	movzbl -0x19(%rbp),%edx
  400e18:	83 c2 0a             	add    $0xa,%edx
  400e1b:	88 10                	mov    %dl,(%rax)
  400e1d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e21:	48 83 c0 05          	add    $0x5,%rax
  400e25:	0f b6 55 e5          	movzbl -0x1b(%rbp),%edx
  400e29:	83 ea 05             	sub    $0x5,%edx
  400e2c:	88 10                	mov    %dl,(%rax)
  400e2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e32:	48 83 c0 06          	add    $0x6,%rax
  400e36:	0f b6 55 e6          	movzbl -0x1a(%rbp),%edx
  400e3a:	83 c2 0b             	add    $0xb,%edx
  400e3d:	88 10                	mov    %dl,(%rax)
  400e3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e43:	48 83 c0 04          	add    $0x4,%rax
  400e47:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
  400e4b:	83 ea 02             	sub    $0x2,%edx
  400e4e:	88 10                	mov    %dl,(%rax)
  400e50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e54:	48 83 c0 04          	add    $0x4,%rax
  400e58:	0f b6 00             	movzbl (%rax),%eax
  400e5b:	3c 35                	cmp    $0x35,%al
  400e5d:	0f 85 eb 00 00 00    	jne    400f4e <main+0x36c>
  400e63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e67:	48 83 c0 06          	add    $0x6,%rax
  400e6b:	0f b6 00             	movzbl (%rax),%eax
  400e6e:	3c 44                	cmp    $0x44,%al
  400e70:	0f 85 d8 00 00 00    	jne    400f4e <main+0x36c>
  400e76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400e7a:	48 83 c0 05          	add    $0x5,%rax
  400e7e:	0f b6 00             	movzbl (%rax),%eax
  400e81:	3c 41                	cmp    $0x41,%al
  400e83:	75 21                	jne    400ea6 <main+0x2c4>
  400e85:	b8 00 00 00 00       	mov    $0x0,%eax
  400e8a:	e8 f0 f9 ff ff       	call   40087f <timmy>
  400e8f:	89 45 ac             	mov    %eax,-0x54(%rbp)
  400e92:	8b 45 ac             	mov    -0x54(%rbp),%eax
  400e95:	89 c7                	mov    %eax,%edi
  400e97:	e8 78 f8 ff ff       	call   400714 <printvv>
  400e9c:	b8 00 00 00 00       	mov    $0x0,%eax
  400ea1:	e9 6e 01 00 00       	jmp    401014 <main+0x432>
  400ea6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400eaa:	48 83 c0 05          	add    $0x5,%rax
  400eae:	0f b6 00             	movzbl (%rax),%eax
  400eb1:	3c 4b                	cmp    $0x4b,%al
  400eb3:	0f 85 81 00 00 00    	jne    400f3a <main+0x358>
  400eb9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400ebd:	48 83 c0 07          	add    $0x7,%rax
  400ec1:	0f b6 00             	movzbl (%rax),%eax
  400ec4:	3c 30                	cmp    $0x30,%al
  400ec6:	75 21                	jne    400ee9 <main+0x307>
  400ec8:	b8 00 00 00 00       	mov    $0x0,%eax
  400ecd:	e8 c2 f9 ff ff       	call   400894 <kenny>
  400ed2:	89 45 b0             	mov    %eax,-0x50(%rbp)
  400ed5:	8b 45 b0             	mov    -0x50(%rbp),%eax
  400ed8:	89 c7                	mov    %eax,%edi
  400eda:	e8 a6 f8 ff ff       	call   400785 <printuu>
  400edf:	b8 00 00 00 00       	mov    $0x0,%eax
  400ee4:	e9 2b 01 00 00       	jmp    401014 <main+0x432>
  400ee9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400eed:	48 83 c0 07          	add    $0x7,%rax
  400ef1:	0f b6 00             	movzbl (%rax),%eax
  400ef4:	3c 43                	cmp    $0x43,%al
  400ef6:	75 21                	jne    400f19 <main+0x337>
  400ef8:	b8 00 00 00 00       	mov    $0x0,%eax
  400efd:	e8 7d f9 ff ff       	call   40087f <timmy>
  400f02:	89 45 b4             	mov    %eax,-0x4c(%rbp)
  400f05:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  400f08:	89 c7                	mov    %eax,%edi
  400f0a:	e8 05 f8 ff ff       	call   400714 <printvv>
  400f0f:	b8 00 00 00 00       	mov    $0x0,%eax
  400f14:	e9 fb 00 00 00       	jmp    401014 <main+0x432>
  400f19:	b8 00 00 00 00       	mov    $0x0,%eax
  400f1e:	e8 ab fa ff ff       	call   4009ce <overcome>
  400f23:	89 45 b8             	mov    %eax,-0x48(%rbp)
  400f26:	8b 45 b8             	mov    -0x48(%rbp),%eax
  400f29:	89 c7                	mov    %eax,%edi
  400f2b:	e8 e4 f7 ff ff       	call   400714 <printvv>
  400f30:	b8 00 00 00 00       	mov    $0x0,%eax
  400f35:	e9 da 00 00 00       	jmp    401014 <main+0x432>
  400f3a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f3f:	e8 92 f7 ff ff       	call   4006d6 <hyp>
  400f44:	b8 00 00 00 00       	mov    $0x0,%eax
  400f49:	e9 c6 00 00 00       	jmp    401014 <main+0x432>
  400f4e:	b8 00 00 00 00       	mov    $0x0,%eax
  400f53:	e8 b2 fa ff ff       	call   400a0a <sakura>
  400f58:	89 45 bc             	mov    %eax,-0x44(%rbp)
  400f5b:	8b 45 bc             	mov    -0x44(%rbp),%eax
  400f5e:	89 c7                	mov    %eax,%edi
  400f60:	e8 af f7 ff ff       	call   400714 <printvv>
  400f65:	b8 00 00 00 00       	mov    $0x0,%eax
  400f6a:	e9 a5 00 00 00       	jmp    401014 <main+0x432>
  400f6f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400f73:	48 89 c7             	mov    %rax,%rdi
  400f76:	e8 7c fb ff ff       	call   400af7 <fourth>
  400f7b:	3d 88 00 00 00       	cmp    $0x88,%eax
  400f80:	0f 85 89 00 00 00    	jne    40100f <main+0x42d>
  400f86:	b8 00 00 00 00       	mov    $0x0,%eax
  400f8b:	e8 7a fa ff ff       	call   400a0a <sakura>
  400f90:	89 45 c0             	mov    %eax,-0x40(%rbp)
  400f93:	8b 45 c0             	mov    -0x40(%rbp),%eax
  400f96:	89 c7                	mov    %eax,%edi
  400f98:	e8 77 f7 ff ff       	call   400714 <printvv>
  400f9d:	b8 00 00 00 00       	mov    $0x0,%eax
  400fa2:	eb 70                	jmp    401014 <main+0x432>
  400fa4:	b8 00 00 00 00       	mov    $0x0,%eax
  400fa9:	e8 d1 f8 ff ff       	call   40087f <timmy>
  400fae:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  400fb1:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  400fb4:	89 c7                	mov    %eax,%edi
  400fb6:	e8 59 f7 ff ff       	call   400714 <printvv>
  400fbb:	b8 00 00 00 00       	mov    $0x0,%eax
  400fc0:	eb 52                	jmp    401014 <main+0x432>
  400fc2:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400fc6:	48 89 c7             	mov    %rax,%rdi
  400fc9:	e8 f3 fa ff ff       	call   400ac1 <second>
  400fce:	83 f8 60             	cmp    $0x60,%eax
  400fd1:	75 1e                	jne    400ff1 <main+0x40f>
  400fd3:	b8 00 00 00 00       	mov    $0x0,%eax
  400fd8:	e8 f1 f9 ff ff       	call   4009ce <overcome>
  400fdd:	89 45 d0             	mov    %eax,-0x30(%rbp)
  400fe0:	8b 45 d0             	mov    -0x30(%rbp),%eax
  400fe3:	89 c7                	mov    %eax,%edi
  400fe5:	e8 2a f7 ff ff       	call   400714 <printvv>
  400fea:	b8 00 00 00 00       	mov    $0x0,%eax
  400fef:	eb 23                	jmp    401014 <main+0x432>
  400ff1:	b8 00 00 00 00       	mov    $0x0,%eax
  400ff6:	e8 0f fa ff ff       	call   400a0a <sakura>
  400ffb:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  400ffe:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  401001:	89 c7                	mov    %eax,%edi
  401003:	e8 0c f7 ff ff       	call   400714 <printvv>
  401008:	b8 00 00 00 00       	mov    $0x0,%eax
  40100d:	eb 05                	jmp    401014 <main+0x432>
  40100f:	b8 00 00 00 00       	mov    $0x0,%eax
  401014:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  401018:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40101f:	00 00 
  401021:	74 05                	je     401028 <main+0x446>
  401023:	e8 48 f5 ff ff       	call   400570 <__stack_chk_fail@plt>
  401028:	c9                   	leave  
  401029:	c3                   	ret    
  40102a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401030 <__libc_csu_init>:
  401030:	41 57                	push   %r15
  401032:	41 56                	push   %r14
  401034:	41 89 ff             	mov    %edi,%r15d
  401037:	41 55                	push   %r13
  401039:	41 54                	push   %r12
  40103b:	4c 8d 25 ce 0d 20 00 	lea    0x200dce(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  401042:	55                   	push   %rbp
  401043:	48 8d 2d ce 0d 20 00 	lea    0x200dce(%rip),%rbp        # 601e18 <__do_global_dtors_aux_fini_array_entry>
  40104a:	53                   	push   %rbx
  40104b:	49 89 f6             	mov    %rsi,%r14
  40104e:	49 89 d5             	mov    %rdx,%r13
  401051:	4c 29 e5             	sub    %r12,%rbp
  401054:	48 83 ec 08          	sub    $0x8,%rsp
  401058:	48 c1 fd 03          	sar    $0x3,%rbp
  40105c:	e8 c7 f4 ff ff       	call   400528 <_init>
  401061:	48 85 ed             	test   %rbp,%rbp
  401064:	74 20                	je     401086 <__libc_csu_init+0x56>
  401066:	31 db                	xor    %ebx,%ebx
  401068:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40106f:	00 
  401070:	4c 89 ea             	mov    %r13,%rdx
  401073:	4c 89 f6             	mov    %r14,%rsi
  401076:	44 89 ff             	mov    %r15d,%edi
  401079:	41 ff 14 dc          	call   *(%r12,%rbx,8)
  40107d:	48 83 c3 01          	add    $0x1,%rbx
  401081:	48 39 eb             	cmp    %rbp,%rbx
  401084:	75 ea                	jne    401070 <__libc_csu_init+0x40>
  401086:	48 83 c4 08          	add    $0x8,%rsp
  40108a:	5b                   	pop    %rbx
  40108b:	5d                   	pop    %rbp
  40108c:	41 5c                	pop    %r12
  40108e:	41 5d                	pop    %r13
  401090:	41 5e                	pop    %r14
  401092:	41 5f                	pop    %r15
  401094:	c3                   	ret    
  401095:	90                   	nop
  401096:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40109d:	00 00 00 

00000000004010a0 <__libc_csu_fini>:
  4010a0:	f3 c3                	repz ret 

Disassembly of section .fini:

00000000004010a4 <_fini>:
  4010a4:	48 83 ec 08          	sub    $0x8,%rsp
  4010a8:	48 83 c4 08          	add    $0x8,%rsp
  4010ac:	c3                   	ret    
